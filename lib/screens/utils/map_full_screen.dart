import 'dart:ui' as ui;
import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import '../../../models/transaction.dart' as model;
import 'map_tile_provider.dart'; // <-- import factory

// Global address cache dùng chung — tránh gọi geocode lặp lại giữa các màn hình
final Map<String, String> _globalAddressCache = {};

Future<String> getAddress(double lat, double lng) async {
  final key = '${lat.toStringAsFixed(5)},${lng.toStringAsFixed(5)}';
  if (_globalAddressCache.containsKey(key)) return _globalAddressCache[key]!;

  try {
    final placemarks = await placemarkFromCoordinates(lat, lng);
    if (placemarks.isNotEmpty) {
      final p = placemarks.first;
      final addr = [
        p.street,
        p.subLocality,
        p.locality,
        p.administrativeArea,
      ].where((e) => e != null && e.isNotEmpty).join(', ');
      _globalAddressCache[key] = addr;
      return addr;
    }
  } catch (e) {
    debugPrint('Geocoding error: $e');
  }

  final fallback = '$lat, $lng';
  _globalAddressCache[key] = fallback;
  return fallback;
}

class MapFullScreen extends StatefulWidget {
  const MapFullScreen({
    super.key,
    required this.transactions,
    required this.title,
    this.mapStyle = 'voyager',
  });

  final List<model.Transaction> transactions;
  final String title;
  final String mapStyle;

  @override
  State<MapFullScreen> createState() => _MapFullScreenState();
}

class _MapFullScreenState extends State<MapFullScreen> {
  final MapController _mapController = MapController();
  model.Transaction? _selectedTransaction;
  String _currentMapStyle = 'voyager';

  // ── Tile provider (cached) ──────────────────────────────────────────────────
  CachedTileProvider? _tileProvider;

  // ── Marker memoization ─────────────────────────────────────────────────────
  List<Marker>? _cachedMarkers;
  String? _cachedSelectedId;
  List<model.Transaction>? _cachedLocated;

  @override
  void initState() {
    super.initState();
    _currentMapStyle = widget.mapStyle;
    _initTileProvider();
  }

  Future<void> _initTileProvider() async {
    final provider = await CachedTileProvider.create();
    if (mounted) setState(() => _tileProvider = provider);
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  // ── URL template ────────────────────────────────────────────────────────────
  String _getMapUrlTemplate() {
    switch (_currentMapStyle) {
      case 'light':
        return 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png';
      case 'osm':
        return 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';
      case 'voyager':
        return 'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png';
      case 'dark':
      default:
        return 'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png';
    }
  }

  // ── Filtered locations ──────────────────────────────────────────────────────
  List<model.Transaction> get _located => widget.transactions
      .where(
        (t) =>
            t.hasLocation &&
            t.latitude != null &&
            t.longitude != null &&
            t.latitude!.isFinite &&
            t.longitude!.isFinite &&
            !t.latitude!.isNaN &&
            !t.longitude!.isNaN,
      )
      .toList();

  LatLng get _center {
    if (_located.isEmpty) return const LatLng(12.2388, 109.1967);
    final avgLat =
        _located.map((t) => t.latitude!).reduce((a, b) => a + b) /
        _located.length;
    final avgLng =
        _located.map((t) => t.longitude!).reduce((a, b) => a + b) /
        _located.length;
    if (!avgLat.isFinite || !avgLng.isFinite) {
      return const LatLng(12.2388, 109.1967);
    }
    return LatLng(avgLat, avgLng);
  }

  // ── Memoized markers — chỉ rebuild khi selection hoặc data thay đổi ─────────
  List<Marker> get _markers {
    final selectedId = _selectedTransaction?.id;
    final located = _located;

    // Nếu cả data lẫn selection không đổi → trả cache
    if (_cachedMarkers != null &&
        _cachedSelectedId == selectedId &&
        identical(_cachedLocated, located)) {
      return _cachedMarkers!;
    }

    _cachedSelectedId = selectedId;
    _cachedLocated = located;
    _cachedMarkers = located.map((t) => _buildMarker(t)).toList();
    return _cachedMarkers!;
  }

  // ── Camera fit ──────────────────────────────────────────────────────────────
  void _fitAllMarkers() {
    try {
      if (_located.isEmpty) return;

      if (_located.length == 1) {
        final t = _located.first;
        _mapController.move(LatLng(t.latitude!, t.longitude!), 16);
        return;
      }

      final validPoints = _located
          .map((t) => LatLng(t.latitude!, t.longitude!))
          .where((p) => p.latitude.isFinite && p.longitude.isFinite)
          .toList();

      if (validPoints.isEmpty) return;
      if (validPoints.length == 1) {
        _mapController.move(validPoints.first, 16);
        return;
      }

      final bounds = LatLngBounds.fromPoints(validPoints);
      _mapController.fitCamera(
        CameraFit.bounds(bounds: bounds, padding: const EdgeInsets.all(60)),
      );
    } catch (e) {
      debugPrint('fitAllMarkers error: $e');
      if (_located.isNotEmpty) {
        final t = _located.first;
        _mapController.move(LatLng(t.latitude!, t.longitude!), 14);
      }
    }
  }

  // ── Map style dialog ─────────────────────────────────────────────────────────
  void _showMapStyleDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2C2C2E),
        title: const Text(
          'Chọn kiểu bản đồ',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _MapStyleOption(
              title: 'Dark Theme',
              value: 'dark',
              selected: _currentMapStyle == 'dark',
              onTap: () => _changeMapStyle('dark'),
            ),
            _MapStyleOption(
              title: 'Light Theme',
              value: 'light',
              selected: _currentMapStyle == 'light',
              onTap: () => _changeMapStyle('light'),
            ),
            _MapStyleOption(
              title: 'OpenStreetMap',
              value: 'osm',
              selected: _currentMapStyle == 'osm',
              onTap: () => _changeMapStyle('osm'),
            ),
            _MapStyleOption(
              title: 'Voyager',
              value: 'voyager',
              selected: _currentMapStyle == 'voyager',
              onTap: () => _changeMapStyle('voyager'),
            ),
          ],
        ),
      ),
    );
  }

  void _changeMapStyle(String style) {
    Navigator.pop(context);
    // Invalidate marker cache khi đổi style (màu cluster có thể khác)
    setState(() {
      _currentMapStyle = style;
      _cachedMarkers = null;
    });
  }

  // ── Build ────────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _center,
              initialZoom: 14,
              onMapReady: () {
                Future.delayed(const Duration(milliseconds: 100), () {
                  if (!mounted) return;
                  _fitAllMarkers();
                });
              },
              onTap: (_, __) => setState(() => _selectedTransaction = null),
            ),
            children: [
              // ── TileLayer với cache + buffer tăng cường ──────────────────
              if (_tileProvider != null)
                TileLayer(
                  urlTemplate: _getMapUrlTemplate(),
                  tileProvider: _tileProvider!,
                  retinaMode: RetinaMode.isHighDensity(context),
                  subdomains: const ['a', 'b', 'c', 'd'],
                  userAgentPackageName: 'com.example.capmoney',
                  // Giữ thêm tile xung quanh viewport → giảm vết trắng khi pan
                  keepBuffer: 4,
                  panBuffer: 2,
                  // flutter_map ^7: dùng TileDisplay thay vì tileFadeInDuration
                  tileDisplay: const TileDisplay.fadeIn(
                    duration: Duration(milliseconds: 200),
                    startOpacity: 0.4,
                  ),
                  additionalOptions: {
                    'r': RetinaMode.isHighDensity(context) ? '@2x' : '',
                  },
                  errorTileCallback: (tile, error, stackTrace) {
                    debugPrint('Tile load error: $error');
                  },
                )
              else
                // Placeholder tối khi tile provider chưa sẵn sàng
                const ColoredBox(color: Color(0xFF1A1A2E)),

              // ── Marker cluster ────────────────────────────────────────────
              MarkerClusterLayerWidget(
                options: MarkerClusterLayerOptions(
                  maxClusterRadius: 45,
                  size: const Size(40, 40),
                  markers: _markers, // dùng getter memoized
                  builder: (context, markers) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF6C63FF),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          markers.length.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                  onClusterTap: (cluster) {
                    try {
                      final bounds = cluster.bounds;
                      if (bounds.northEast.latitude.isFinite &&
                          bounds.northEast.longitude.isFinite &&
                          bounds.southWest.latitude.isFinite &&
                          bounds.southWest.longitude.isFinite) {
                        _mapController.fitCamera(
                          CameraFit.bounds(bounds: bounds),
                        );
                      }
                    } catch (e) {
                      debugPrint('onClusterTap error: $e');
                    }
                  },
                ),
              ),
            ],
          ),

          // ── Top bar ──────────────────────────────────────────────────────
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  _IconButton(
                    icon: Icons.close,
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white12),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 14,
                          color: Color(0xFF6C63FF),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${_located.length} giao dịch',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  _IconButton(
                    icon: Icons.layers_rounded,
                    onTap: _showMapStyleDialog,
                  ),
                  const SizedBox(width: 8),
                  _IconButton(
                    icon: Icons.my_location,
                    onTap: () => _mapController.move(_center, 14),
                  ),
                ],
              ),
            ),
          ),

          // ── Detail card ───────────────────────────────────────────────────
          if (_selectedTransaction != null)
            Positioned(
              left: 16,
              right: 16,
              bottom: 40,
              child: _TransactionDetailCard(
                transaction: _selectedTransaction!,
                onClose: () => setState(() => _selectedTransaction = null),
              ),
            ),

          // ── Loading overlay khi tile provider chưa ready ─────────────────
          if (_tileProvider == null)
            const Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Color(0xFF6C63FF),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ── Marker builder ───────────────────────────────────────────────────────────
  Marker _buildMarker(model.Transaction t) {
    final isExpense = t.type == model.TransactionType.expense;
    final isSelected = _selectedTransaction?.id == t.id;
    final color = isExpense
        ? const Color(0xFFE53935)
        : const Color(0xFF2E7D32);

    return Marker(
      point: LatLng(t.latitude!, t.longitude!),
      width: isSelected ? 64 : 52,
      height: isSelected ? 64 : 52,
      child: GestureDetector(
        onTap: () => setState(() {
          _selectedTransaction = t;
          _cachedMarkers = null; // invalidate để rebuild với trạng thái selected mới
        }),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: isSelected ? 52 : 42,
                height: isSelected ? 52 : 42,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isSelected ? Colors.white : Colors.white24,
                    width: isSelected ? 2.5 : 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.5),
                      blurRadius: isSelected ? 16 : 8,
                      spreadRadius: isSelected ? 2 : 0,
                    ),
                  ],
                ),
                child: t.imagePath != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          io.File(t.imagePath!),
                          fit: BoxFit.cover,
                        ),
                      )
                    : Center(
                        child: Text(
                          t.category.icon,
                          style: TextStyle(fontSize: isSelected ? 22 : 18),
                        ),
                      ),
              ),
              CustomPaint(
                size: const Size(10, 6),
                painter: _TrianglePainter(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Reusable icon button ─────────────────────────────────────────────────────
class _IconButton extends StatelessWidget {
  const _IconButton({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white12),
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}

// ── Triangle pin painter ─────────────────────────────────────────────────────
class _TrianglePainter extends CustomPainter {
  final Color color;
  const _TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = ui.Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _TrianglePainter old) => old.color != color;
}

// ── Transaction detail card ──────────────────────────────────────────────────
class _TransactionDetailCard extends StatefulWidget {
  const _TransactionDetailCard({
    required this.transaction,
    required this.onClose,
  });

  final model.Transaction transaction;
  final VoidCallback onClose;

  @override
  State<_TransactionDetailCard> createState() => _TransactionDetailCardState();
}

class _TransactionDetailCardState extends State<_TransactionDetailCard> {
  String? _address;

  @override
  void initState() {
    super.initState();
    _loadAddress();
  }

  @override
  void didUpdateWidget(covariant _TransactionDetailCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.transaction.id != widget.transaction.id) {
      _address = null;
      _loadAddress();
    }
  }

  Future<void> _loadAddress() async {
    final t = widget.transaction;
    if (t.latitude == null || t.longitude == null) return;

    // getAddress đã có global cache — sẽ trả ngay nếu đã load trước đó
    final addr = await getAddress(t.latitude!, t.longitude!);
    if (mounted) setState(() => _address = addr);
  }

  Future<void> _openGoogleMaps(double lat, double lng) async {
    final uri = Uri.parse('geo:$lat,$lng?q=$lat,$lng');
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Không tìm thấy ứng dụng bản đồ'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi khi mở bản đồ: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.transaction;
    final isExpense = t.type == model.TransactionType.expense;
    final formatter = NumberFormat('#,###', 'vi_VN');
    final accentColor =
        isExpense ? const Color(0xFFE53935) : const Color(0xFF2E7D32);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 12, 0),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: accentColor.withOpacity(0.3)),
                  ),
                  child: t.imagePath != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            io.File(t.imagePath!),
                            fit: BoxFit.cover,
                          ),
                        )
                      : Center(
                          child: Text(
                            t.category.icon,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            t.category.icon,
                            style: const TextStyle(fontSize: 13),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            t.category.label,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 13,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: accentColor.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              isExpense ? 'Chi tiêu' : 'Thu nhập',
                              style: TextStyle(
                                color: accentColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${isExpense ? '−' : '+'} ${formatter.format(t.amount)}đ',
                        style: TextStyle(
                          color: accentColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: widget.onClose,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white54,
                      size: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(color: Colors.white12, height: 24),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              children: [
                if (t.note.isNotEmpty)
                  _InfoRow(
                    icon: Icons.notes_rounded,
                    label: 'Ghi chú',
                    value: t.note,
                  ),
                const SizedBox(height: 8),
                _InfoRow(
                  icon: Icons.calendar_today_rounded,
                  label: 'Ngày',
                  value: DateFormat('dd/MM/yyyy – HH:mm').format(t.date),
                ),
                const SizedBox(height: 8),
                _InfoRow(
                  icon: Icons.location_on_rounded,
                  label: 'Vị trí',
                  value: _address ?? 'Đang tải địa chỉ...',
                  valueColor: const Color(0xFF6C63FF),
                  onTap: () => _openGoogleMaps(t.latitude!, t.longitude!),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Info row ─────────────────────────────────────────────────────────────────
class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 15, color: Colors.white38),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(color: Colors.white38, fontSize: 13),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: valueColor ?? Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Map style option ─────────────────────────────────────────────────────────
class _MapStyleOption extends StatelessWidget {
  const _MapStyleOption({
    required this.title,
    required this.value,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String value;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF6C63FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? const Color(0xFF6C63FF) : Colors.white54,
          ),
        ),
        child: selected
            ? const Icon(Icons.check, size: 16, color: Colors.white)
            : null,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.white : Colors.white70,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: onTap,
    );
  }
}