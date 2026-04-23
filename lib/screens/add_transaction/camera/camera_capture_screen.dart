import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../../providers/transaction_provider.dart';
import '../add_transaction/add_transaction_screen.dart';
import 'camera_icon_button.dart';
import 'camera_lifecycle_mixin.dart';
import 'shutter_button.dart';

class CameraCaptureScreen extends StatefulWidget {
  const CameraCaptureScreen({super.key, this.preselectedDate});

  final DateTime? preselectedDate;

  @override
  State<CameraCaptureScreen> createState() => _CameraCaptureScreenState();
}

class _CameraCaptureScreenState extends State<CameraCaptureScreen>
    with WidgetsBindingObserver, CameraLifecycleMixin {
  bool _isCapturing = false;
  bool _isActionInProgress = false;

  // ── Lifecycle ─────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkPermissionsAndInit();
  }

  @override
  void dispose() {
    isDisposing = true;
    WidgetsBinding.instance.removeObserver(this);
    disposeCamera();
    super.dispose();
  }

  // ── Permissions ───────────────────────────────────────────────────────────

  Future<void> _checkPermissionsAndInit() async {
    if (!mounted) return;

    var status = await Permission.camera.status;
    if (!status.isGranted) status = await Permission.camera.request();

    if (status.isGranted && mounted) {
      await initCamera();
    } else if (mounted) {
      setState(() => cameraErrorMessage = 'Quyền truy cập camera bị từ chối');
      _showSnackBar('Vui lòng bật quyền camera trong cài đặt');
    }
  }

  // ── Flash ─────────────────────────────────────────────────────────────────

  Future<void> _toggleFlash() async {
    if (_isActionInProgress || _isCapturing || isDisposing || !mounted) return;
    if (cameraController == null || !isInitialized) return;

    _isActionInProgress = true;
    try {
      HapticFeedback.selectionClick();
      final newFlash = !isFlashOn;
      setState(() => isFlashOn = newFlash);

      try {
        await cameraController!.setFlashMode(
          newFlash ? FlashMode.torch : FlashMode.off,
        );
      } catch (e) {
        debugPrint('Flash toggle error: $e');
        if (mounted) setState(() => isFlashOn = !newFlash);
        _showSnackBar('Thiết bị không hỗ trợ đèn flash');
      }
    } finally {
      _isActionInProgress = false;
    }
  }

  // ── Capture ───────────────────────────────────────────────────────────────

  Future<void> _captureAndProceed() async {
    if (cameraController == null ||
        !isInitialized ||
        _isCapturing ||
        isDisposing ||
        !mounted) return;

    final provider = Provider.of<TransactionProvider>(context, listen: false);

    setState(() => _isCapturing = true);
    HapticFeedback.mediumImpact();

    try {
      final file = await cameraController!.takePicture().timeout(
        const Duration(seconds: 10),
        onTimeout: () => throw TimeoutException('Chụp ảnh quá lâu'),
      );

      if (mounted && !isDisposing) {
        _goToForm(imagePath: file.path, provider: provider);
      }
    } on TimeoutException catch (e) {
      debugPrint('Capture timeout: $e');
      if (mounted) {
        setState(() => _isCapturing = false);
        _showSnackBar('Chụp ảnh quá lâu, vui lòng thử lại');
      }
    } on CameraException catch (e) {
      debugPrint('Camera capture error: $e');
      if (mounted) {
        setState(() => _isCapturing = false);
        _showSnackBar('Lỗi camera: ${e.description}');
      }
    } catch (e) {
      debugPrint('Capture error: $e');
      if (mounted) {
        setState(() => _isCapturing = false);
        _showSnackBar('Chụp ảnh thất bại, vui lòng thử lại');
      }
    }
  }

  // ── Gallery ───────────────────────────────────────────────────────────────

  Future<void> _openGallery() async {
    if (_isCapturing || !mounted) return;

    final provider = Provider.of<TransactionProvider>(context, listen: false);

    try {
      final picked = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1920,
      );
      if (picked != null && mounted && !isDisposing) {
        _goToForm(imagePath: picked.path, provider: provider);
      }
    } catch (e) {
      debugPrint('Gallery pick error: $e');
      if (mounted) _showSnackBar('Không thể chọn ảnh');
    }
  }

  // ── Navigation ────────────────────────────────────────────────────────────

  void _skipPhoto() {
    if (_isCapturing || !mounted) return;
    final provider = Provider.of<TransactionProvider>(context, listen: false);
    _goToForm(provider: provider);
  }

  void _goToForm({String? imagePath, required TransactionProvider provider}) {
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => AddTransactionScreen(
          initialImagePath: imagePath,
          preselectedDate: widget.preselectedDate,
          provider: provider,
        ),
      ),
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  void _showSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _buildTopBar(),
                _buildCameraPreview(),
                const Spacer(),
                _buildBottomControls(),
              ],
            ),
            if (cameraErrorMessage != null) _buildErrorOverlay(),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorOverlay() {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.7),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 48),
              const SizedBox(height: 16),
              Text(
                cameraErrorMessage!,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _checkPermissionsAndInit,
                child: const Text('Thử lại'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          TextButton(
            onPressed: _isCapturing ? null : () => Navigator.pop(context),
            child: const Text(
              'Huỷ',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
          if (widget.preselectedDate != null)
            Expanded(
              child: Text(
                '${widget.preselectedDate!.day}/${widget.preselectedDate!.month}/${widget.preselectedDate!.year}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.55),
                  fontSize: 13,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFittedCameraPreview() {
    final controller = cameraController!;
    final previewSize = controller.value.previewSize;
    if (previewSize == null) return CameraPreview(controller);

    // previewSize.width = cạnh DÀI (landscape); .height = cạnh NGẮN
    // Trong portrait: cameraW = height sensor, cameraH = width sensor
    final cameraW = previewSize.height;
    final cameraH = previewSize.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        final frameW = constraints.maxWidth;
        final frameH = constraints.maxHeight;

        final scaleX = frameW / cameraW;
        final scaleY = frameH / cameraH;
        final scale = scaleX > scaleY ? scaleX : scaleY;

        final scaledW = cameraW * scale;
        final scaledH = cameraH * scale;

        return ClipRect(
          child: SizedBox(
            width: frameW,
            height: frameH,
            child: OverflowBox(
              maxWidth: scaledW,
              maxHeight: scaledH,
              child: SizedBox(
                width: scaledW,
                height: scaledH,
                child: CameraPreview(controller),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCameraPreview() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 30, 16, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: AspectRatio(
          aspectRatio: 0.9,
          child: Stack(
            children: [
              SizedBox.expand(
                child: (isInitialized && cameraController != null)
                    ? _buildFittedCameraPreview()
                    : Container(
                        color: const Color(0xFF1C1C1E),
                        child: Center(
                          child: isSwitching
                              ? const CircularProgressIndicator(
                                  color: Colors.white38,
                                )
                              : const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircularProgressIndicator(
                                      color: Colors.white38,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Đang khởi tạo...',
                                      style:
                                          TextStyle(color: Colors.white54),
                                    ),
                                  ],
                                ),
                        ),
                      ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: CameraIconButton(
                  icon: isFlashOn
                      ? Icons.flash_on_rounded
                      : Icons.flash_off_rounded,
                  onTap: _toggleFlash,
                  isEnabled: !_isCapturing && isInitialized,
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: CameraIconButton(
                  icon: isSwitching
                      ? Icons.sync
                      : Icons.flip_camera_ios_rounded,
                  onTap: () => switchCamera(
                    isCapturing: _isCapturing,
                    onError: () => _showSnackBar('Không thể chuyển camera'),
                  ),
                  isEnabled:
                      !_isCapturing && cameras.length > 1 && !isSwitching,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomControls() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
      child: Column(
        children: [
          ShutterButton(isCapturing: _isCapturing, onTap: _captureAndProceed),
          const SizedBox(height: 55),
          SizedBox(
            height: 50,
            child: Center(
              child: ElevatedButton.icon(
                onPressed: _isCapturing || isSwitching ? null : _openGallery,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                ).copyWith(
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 161, 5, 94).withOpacity(0.2),
                  ),
                  foregroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 234, 6, 135),
                  ),
                  overlayColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 255, 77, 77).withOpacity(0.08),
                  ),
                ),
                icon: const Icon(Icons.photo_library_rounded, size: 18),
                label: const Text(
                  'Chọn từ thư viện',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: _isCapturing || isSwitching ? null : _skipPhoto,
            child: Text(
              'Bỏ qua ảnh',
              style: TextStyle(
                color: Colors.white.withOpacity(
                  (_isCapturing || isSwitching) ? 0.25 : 0.55,
                ),
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}