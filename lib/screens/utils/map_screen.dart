import 'dart:ui' as ui;
import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import '../../../models/transaction.dart' as model;
import '../../../providers/transaction_provider.dart';
import 'map_tile_provider.dart';
import 'map_full_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  _FilterMode _filterMode = _FilterMode.month;
  int _monthOffset = 0;
  int _yearOffset = 0;
  model.Category? _selectedCategory;
  String _selectedMapStyle = 'voyager';

  final _formatter = NumberFormat('#,###', 'vi_VN');

  final MapController _previewMapController = MapController();
  CachedTileProvider? _tileProvider;
  List<Marker>? _cachedPreviewMarkers;
  List<model.Transaction>? _cachedPreviewLocated;

  @override
  void initState() {
    super.initState();
    _initTileProvider();
  }

  Future<void> _initTileProvider() async {
    final provider = await CachedTileProvider.create();
    if (mounted) setState(() => _tileProvider = provider);
  }

  @override
  void dispose() {
    _previewMapController.dispose();
    super.dispose();
  }

  // ── Helpers ──────────────────────────────────────────────────────────────────
  DateTime get _now => DateTime.now();
  DateTime get _currentMonth => DateTime(_now.year, _now.month + _monthOffset);
  int get _currentYear => _now.year + _yearOffset;

  String _getMapUrlTemplate() {
    switch (_selectedMapStyle) {
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

  String get _periodLabel {
    if (_filterMode == _FilterMode.month) {
      final m = _currentMonth;
      return 'Tháng ${m.month}/${m.year}';
    }
    return 'Năm $_currentYear';
  }

  List<model.Transaction> _getFiltered(List<model.Transaction> allTx) {
    List<model.Transaction> list;
    if (_filterMode == _FilterMode.month) {
      list = allTx
          .where(
            (t) =>
                t.date.year == _currentMonth.year &&
                t.date.month == _currentMonth.month,
          )
          .toList();
    } else {
      list = allTx.where((t) => t.date.year == _currentYear).toList();
    }
    if (_selectedCategory != null) {
      list = list.where((t) => t.category == _selectedCategory).toList();
    }
    return list;
  }

  List<model.Transaction> _getLocated(List<model.Transaction> filtered) =>
      filtered
          .where(
            (t) =>
                t.hasLocation &&
                t.latitude != null &&
                t.longitude != null &&
                t.latitude!.isFinite &&
                t.longitude!.isFinite,
          )
          .toList();

  double _totalIncome(List<model.Transaction> filtered) => filtered
      .where((t) => t.type == model.TransactionType.income)
      .fold(0.0, (s, t) => s + t.amount);

  double _totalExpense(List<model.Transaction> filtered) => filtered
      .where((t) => t.type == model.TransactionType.expense)
      .fold(0.0, (s, t) => s + t.amount);

  LatLng _mapCenter(List<model.Transaction> located) {
    if (located.isEmpty) return const LatLng(12.2388, 109.1967);
    final avgLat =
        located.map((t) => t.latitude!).reduce((a, b) => a + b) /
        located.length;
    final avgLng =
        located.map((t) => t.longitude!).reduce((a, b) => a + b) /
        located.length;
    return LatLng(avgLat, avgLng);
  }

  List<Marker> _getPreviewMarkers(List<model.Transaction> located) {
    if (_cachedPreviewMarkers != null &&
        _cachedPreviewLocated != null &&
        _listsEqual(_cachedPreviewLocated!, located)) {
      return _cachedPreviewMarkers!;
    }
    _cachedPreviewLocated = located;
    _cachedPreviewMarkers = located.map(_buildPreviewMarker).toList();
    return _cachedPreviewMarkers!;
  }

  bool _listsEqual(List<model.Transaction> a, List<model.Transaction> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i].id != b[i].id) return false;
    }
    return true;
  }

  void _onFilterChanged(VoidCallback change, List<model.Transaction> allTx) {
    setState(change);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      try {
        final located = _getLocated(_getFiltered(allTx));
        _previewMapController.move(_mapCenter(located), 13);
      } catch (_) {}
    });
  }

  void _openFullMap(List<model.Transaction> located) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MapFullScreen(
          transactions: located,
          title: _periodLabel,
          mapStyle: _selectedMapStyle,
        ),
      ),
    );
  }

  // ── Build ─────────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionProvider>(
      builder: (context, provider, _) {
        final allTx = provider.transactions;
        final filtered = _getFiltered(allTx);
        final located = _getLocated(filtered);
        final center = _mapCenter(located);
        final markers = _getPreviewMarkers(located);

        return Scaffold(
          backgroundColor: const Color(0xFF0F0F1A),
          body: SafeArea(
            child: Column(
              children: [
                // ── App bar ─────────────────────────────────────────────────
                _buildAppBar(context),

                // ── Scrollable content (bố cục y hệt MapTab) ──────────────
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 24),
                    children: [
                      _buildFilterModeToggle(allTx),
                      const SizedBox(height: 7),
                      _buildPeriodNavigator(allTx),
                      const SizedBox(height: 7),
                      _buildSummaryRow(filtered),
                      const SizedBox(height: 7),
                      _buildCategoryFilter(filtered, allTx),
                      const SizedBox(height: 7),
                      _buildMapStyleSelector(),
                      const SizedBox(height: 7),
                      _buildMapPreview(located, center, markers),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ── App bar (phần thêm mới duy nhất) ─────────────────────────────────────────
  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 16, 0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              HapticFeedback.selectionClick();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
            color: Colors.white70,
          ),
          const Expanded(
            child: Text(
              'Bản đồ giao dịch',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.3,
              ),
            ),
          ),
          // Badge kỳ hiện tại
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFF8B5CF6).withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFF8B5CF6).withOpacity(0.4),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.calendar_today_rounded,
                  size: 12,
                  color: Color(0xFF9D8EFF),
                ),
                const SizedBox(width: 5),
                Text(
                  _periodLabel,
                  style: const TextStyle(
                    color: Color(0xFF9D8EFF),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Các widget bên dưới giữ nguyên 100% so với MapTab ────────────────────────

  Widget _buildFilterModeToggle(List<model.Transaction> allTx) {
    return Container(
      height: 36,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1B2F),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          _ModeChip(
            label: 'Tháng',
            isSelected: _filterMode == _FilterMode.month,
            onTap: () => _onFilterChanged(() {
              _filterMode = _FilterMode.month;
              _monthOffset = 0;
              _cachedPreviewMarkers = null;
            }, allTx),
          ),
          _ModeChip(
            label: 'Năm',
            isSelected: _filterMode == _FilterMode.year,
            onTap: () => _onFilterChanged(() {
              _filterMode = _FilterMode.year;
              _yearOffset = 0;
              _cachedPreviewMarkers = null;
            }, allTx),
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodNavigator(List<model.Transaction> allTx) {
    final canGoNext = _filterMode == _FilterMode.month
        ? _monthOffset < 0
        : _yearOffset < 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1B2F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavButton(
            icon: Icons.chevron_left,
            onTap: () => _onFilterChanged(() {
              if (_filterMode == _FilterMode.month) {
                _monthOffset--;
              } else {
                _yearOffset--;
              }
              _cachedPreviewMarkers = null;
            }, allTx),
          ),
          Expanded(
            child: Text(
              _periodLabel,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          _NavButton(
            icon: Icons.chevron_right,
            onTap: canGoNext
                ? () => _onFilterChanged(() {
                    if (_filterMode == _FilterMode.month) {
                      _monthOffset++;
                    } else {
                      _yearOffset++;
                    }
                    _cachedPreviewMarkers = null;
                  }, allTx)
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(List<model.Transaction> filtered) {
    return Row(
      children: [
        Expanded(
          child: _SummaryChip(
            label: 'Thu',
            amount: _totalIncome(filtered),
            isIncome: true,
            formatter: _formatter,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _SummaryChip(
            label: 'Chi',
            amount: _totalExpense(filtered),
            isIncome: false,
            formatter: _formatter,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryFilter(
    List<model.Transaction> filtered,
    List<model.Transaction> allTx,
  ) {
    final presentCategories = filtered.map((t) => t.category).toSet().toList()
      ..sort((a, b) => a.index.compareTo(b.index));

    return SizedBox(
      height: 40,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _CategoryChip(
              label: 'Tất cả',
              emoji: '📋',
              isSelected: _selectedCategory == null,
              onTap: () => _onFilterChanged(() {
                _selectedCategory = null;
                _cachedPreviewMarkers = null;
              }, allTx),
            ),
            const SizedBox(width: 6),
            ...presentCategories.map(
              (cat) => Padding(
                padding: const EdgeInsets.only(right: 6),
                child: _CategoryChip(
                  label: cat.label,
                  emoji: cat.icon,
                  isSelected: _selectedCategory == cat,
                  onTap: () => _onFilterChanged(() {
                    _selectedCategory = _selectedCategory == cat ? null : cat;
                    _cachedPreviewMarkers = null;
                  }, allTx),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapStyleSelector() {
    return Container(
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1B2F),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        children: [
          const Icon(Icons.map_rounded, size: 16, color: Colors.white70),
          const SizedBox(width: 6),
          const Text(
            'Kiểu:',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: DropdownButton<String>(
              value: _selectedMapStyle,
              isExpanded: true,
              dropdownColor: const Color(0xFF1B1B2F),
              underline: const SizedBox(),
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 16,
                color: Colors.white70,
              ),
              style: const TextStyle(color: Colors.white, fontSize: 12),
              itemHeight: 48,
              items: const [
                DropdownMenuItem(value: 'dark', child: Text('Dark')),
                DropdownMenuItem(value: 'light', child: Text('Light')),
                DropdownMenuItem(value: 'osm', child: Text('OSM')),
                DropdownMenuItem(value: 'voyager', child: Text('Voyager')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedMapStyle = value;
                    _cachedPreviewMarkers = null;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapPreview(
    List<model.Transaction> located,
    LatLng center,
    List<Marker> markers,
  ) {
    return Container(
      height: 340,
      decoration: BoxDecoration(
        color: const Color(0xFF1B1B2F),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white12),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          FlutterMap(
            mapController: _previewMapController,
            options: MapOptions(
              initialCenter: center,
              initialZoom: 13,
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.none,
              ),
            ),
            children: [
              if (_tileProvider != null)
                TileLayer(
                  urlTemplate: _getMapUrlTemplate(),
                  tileProvider: _tileProvider!,
                  retinaMode: RetinaMode.isHighDensity(context),
                  subdomains: const ['a', 'b', 'c', 'd'],
                  userAgentPackageName: 'com.example.capmoney',
                  keepBuffer: 4,
                  panBuffer: 2,
                  tileDisplay: const TileDisplay.fadeIn(
                    duration: Duration(milliseconds: 200),
                    startOpacity: 0.4,
                  ),
                  additionalOptions: {
                    'r': RetinaMode.isHighDensity(context) ? '@2x' : '',
                  },
                  errorTileCallback: (tile, error, stackTrace) {
                    debugPrint('Preview tile error: $error');
                  },
                )
              else
                const ColoredBox(color: Color(0xFF1A1A2E)),
              MarkerLayer(markers: markers),
            ],
          ),

          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _openFullMap(located),
                child: const SizedBox.expand(),
              ),
            ),
          ),

          Positioned(
            left: 14,
            bottom: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 14,
                    color: Color(0xFF8B5CF6),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '${located.length} giao dịch',
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            right: 14,
            bottom: 14,
            child: GestureDetector(
              onTap: () => _openFullMap(located),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B5CF6),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF8B5CF6).withOpacity(0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Mở bản đồ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.open_in_new_rounded,
                      size: 14,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),

          if (located.isEmpty)
            Container(
              color: Colors.black54,
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_off_outlined,
                      size: 48,
                      color: Colors.white38,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Không có giao dịch có vị trí\ntrong kỳ này',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Marker _buildPreviewMarker(model.Transaction t) {
    final isExpense = t.type == model.TransactionType.expense;
    final color = isExpense ? const Color(0xFFE53935) : const Color(0xFF2E7D32);

    return Marker(
      point: LatLng(t.latitude!, t.longitude!),
      width: 44,
      height: 50,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white38, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.5),
                  blurRadius: 16,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: t.imagePath != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(io.File(t.imagePath!), fit: BoxFit.cover),
                  )
                : Center(
                    child: Text(
                      t.category.icon,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
          ),
          CustomPaint(
            size: const Size(8, 5),
            painter: _TrianglePainter(color: color),
          ),
        ],
      ),
    );
  }
}

// ── Enums ─────────────────────────────────────────────────────────────────────
enum _FilterMode { month, year }

// ── Triangle pin painter ──────────────────────────────────────────────────────
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

// ── Mode chip ─────────────────────────────────────────────────────────────────
class _ModeChip extends StatelessWidget {
  const _ModeChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: double.infinity,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF8B5CF6) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white54,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

// ── Nav button ────────────────────────────────────────────────────────────────
class _NavButton extends StatelessWidget {
  const _NavButton({required this.icon, this.onTap});
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: onTap != null ? Colors.white : Colors.white24,
          size: 20,
        ),
      ),
    );
  }
}

// ── Summary chip ──────────────────────────────────────────────────────────────
// ── Summary chip ──────────────────────────────────────────────────────────────
// ── Summary chip ──────────────────────────────────────────────────────────────
class _SummaryChip extends StatelessWidget {
  const _SummaryChip({
    required this.label,
    required this.amount,
    required this.isIncome,
    required this.formatter,
  });
  final String label;
  final double amount;
  final bool isIncome;
  final NumberFormat formatter;

  @override
  Widget build(BuildContext context) {
    // 🎨 Màu sắc đậm và ấn tượng hơn
    final Color primaryColor = isIncome
        ? const Color(0xFF00E5B8) // Xanh ngọc đậm, nổi bật cho Thu
        : const Color(0xFFFF4757); // Đỏ coral đậm cho Chi

    final Color backgroundColor = isIncome
        ? const Color(0xFF0D3D34) // Nền xanh đen đậm cho Thu
        : const Color(0xFF3D0D1F); // Nền đỏ đen đậm cho Chi

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        // 🌈 Gradient background tạo chiều sâu
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [backgroundColor, backgroundColor.withOpacity(0.8)],
        ),
        borderRadius: BorderRadius.circular(16),
        // ✨ Viền sáng hơn, nổi hơn
        border: Border.all(color: primaryColor.withOpacity(0.6), width: 2),
        // 🌟 Shadow mạnh hơn, tạo chiều sâu
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.3),
            blurRadius: 16,
            offset: const Offset(0, 4),
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // 🎯 Icon với background riêng
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: primaryColor.withOpacity(0.4),
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      isIncome
                          ? Icons.arrow_downward_rounded
                          : Icons.arrow_upward_rounded,
                      size: 16,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                      shadows: [
                        Shadow(
                          color: primaryColor.withOpacity(0.5),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // 💰 Icon ví/giỏ hàng với effect glow
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  isIncome
                      ? Icons.account_balance_wallet_rounded
                      : Icons.shopping_cart_rounded,
                  size: 16,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // 💵 Số tiền với font đậm hơn, có glow effect
          Text(
            '${formatter.format(amount)}đ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 18,
              letterSpacing: -0.5,
              shadows: [
                Shadow(
                  color: primaryColor.withOpacity(0.6),
                  blurRadius: 12,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
          ),
          // ✅ Đã bỏ thanh indicator ở đây
        ],
      ),
    );
  }
}

// ── Category chip ─────────────────────────────────────────────────────────────
class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.label,
    required this.emoji,
    required this.isSelected,
    required this.onTap,
  });
  final String label;
  final String emoji;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF8B5CF6) : const Color(0xFF1B1B2F),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF8B5CF6) : Colors.white12,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 12)),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white70,
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
