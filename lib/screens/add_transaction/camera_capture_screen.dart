import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'add_transaction_screen.dart';
import '../../providers/transaction_provider.dart';
import 'dart:async';

class CameraCaptureScreen extends StatefulWidget {
  const CameraCaptureScreen({super.key, this.preselectedDate});
  final DateTime? preselectedDate;

  @override
  State<CameraCaptureScreen> createState() => _CameraCaptureScreenState();
}

class _CameraCaptureScreenState extends State<CameraCaptureScreen>
    with WidgetsBindingObserver {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];

  int _selectedCameraIndex = 0;
  bool _isFlashOn = false;
  bool _isCapturing = false;
  bool _isInitialized = false;
  bool _isDisposing = false;
  bool _isSwitching = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkPermissionsAndInit();
  }

  @override
  void dispose() {
    _isDisposing = true;
    WidgetsBinding.instance.removeObserver(this);
    _disposeCamera();
    super.dispose();
  }

  // THAY THẾ _disposeCamera bằng:
  Future<void> _disposeCamera() async {
    if (_controller == null) return;

    final CameraController controller = _controller!;
    _controller = null;
    _isInitialized = false;

    try {
      // Đảm bảo dừng mọi stream trước khi dispose
      if (controller.value.isStreamingImages) {
        await controller.stopImageStream();
      }

      // Thêm delay nhỏ để tránh race condition
      await Future.delayed(const Duration(milliseconds: 100));

      await controller.dispose();
    } catch (e) {
      debugPrint('Camera dispose error: $e');
    }
  }

  Future<void> _checkPermissionsAndInit() async {
    if (!mounted) return;

    var status = await Permission.camera.status;

    if (!status.isGranted) {
      status = await Permission.camera.request();
    }

    if (status.isGranted && mounted) {
      await _initCamera();
    } else if (mounted) {
      setState(() {
        _errorMessage = 'Quyền truy cập camera bị từ chối';
      });
      _showSnackBar('Vui lòng bật quyền camera trong cài đặt');
    }
  }

  // THAY THẾ didChangeAppLifecycleState hiện tại bằng:
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_isDisposing) return;

    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) return;

    if (state == AppLifecycleState.inactive) {
      // Chỉ dừng preview nhưng không dispose hoàn toàn
      _stopCameraPreview();
    } else if (state == AppLifecycleState.resumed) {
      if (!_isInitialized && !_isDisposing && mounted) {
        _initCamera(cameraIndex: _selectedCameraIndex);
      }
    } else if (state == AppLifecycleState.paused) {
      // Giữ camera active khi app bị paused
      _stopCameraPreview();
    }
  }

  Future<void> _stopCameraPreview() async {
    if (_controller == null || !_controller!.value.isInitialized) return;

    try {
      if (_controller!.value.isStreamingImages) {
        await _controller!.stopImageStream();
      }
    } catch (e) {
      debugPrint('Stop preview error: $e');
    }
  }

  // THAY THẾ _initCamera bằng:
  Future<void> _initCamera({int cameraIndex = 0}) async {
    if (_isDisposing || !mounted) return;

    setState(() {
      _isInitialized = false;
      _errorMessage = null;
    });

    try {
      if (_cameras.isEmpty) {
        _cameras = await availableCameras();
        if (_cameras.isEmpty) {
          throw Exception('Không tìm thấy camera nào trên thiết bị');
        }
      }

      final index = cameraIndex.clamp(0, _cameras.length - 1);
      _selectedCameraIndex = index;

      // Dispose controller cũ nếu tồn tại
      await _disposeCamera();

      final controller = CameraController(
        _cameras[index],
        ResolutionPreset.medium, // GIẢM từ high xuống medium
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      _controller = controller;
      await controller.initialize();

      if (_isDisposing || !mounted) {
        await controller.dispose();
        return;
      }

      await controller.setFlashMode(
        _isFlashOn ? FlashMode.torch : FlashMode.off,
      );

      if (mounted) {
        setState(() => _isInitialized = true);
      }
    } catch (e) {
      debugPrint('Camera init error: $e');
      if (mounted) {
        setState(() {
          _isInitialized = false;
          _errorMessage = 'Không thể khởi tạo camera';
        });
      }
    }
  }

  Future<void> _switchCamera() async {
    if (_cameras.length < 2 ||
        _isCapturing ||
        _isSwitching ||
        _isDisposing ||
        !mounted)
      return;

    setState(() => _isSwitching = true);

    try {
      HapticFeedback.lightImpact();
      final nextIndex = (_selectedCameraIndex + 1) % _cameras.length;

      await _disposeCamera();
      await Future.delayed(const Duration(milliseconds: 300));

      if (!_isDisposing && mounted) {
        await _initCamera(cameraIndex: nextIndex);
      }
    } catch (e) {
      debugPrint('Switch camera error: $e');
      if (mounted) _showSnackBar('Không thể chuyển camera');
    } finally {
      if (mounted) setState(() => _isSwitching = false);
    }
  }

  bool _isActionInProgress = false;

  Future<void> _toggleFlash() async {
    if (_isActionInProgress || _isCapturing || _isDisposing || !mounted) return;
    if (_controller == null || !_isInitialized) return;

    _isActionInProgress = true;
    try {
      HapticFeedback.selectionClick();
      final newFlash = !_isFlashOn;

      setState(() => _isFlashOn = newFlash);

      try {
        await _controller!.setFlashMode(
          newFlash ? FlashMode.torch : FlashMode.off,
        );
      } catch (e) {
        debugPrint('Flash toggle error: $e');
        if (mounted) setState(() => _isFlashOn = !newFlash);
        _showSnackBar('Thiết bị không hỗ trợ đèn flash');
      }
    } finally {
      _isActionInProgress = false;
    }
  }

  // THAY THẾ _captureAndProceed bằng:
  Future<void> _captureAndProceed() async {
    if (_controller == null ||
        !_isInitialized ||
        _isCapturing ||
        _isDisposing ||
        !mounted)
      return;

    final provider = Provider.of<TransactionProvider>(context, listen: false);

    setState(() => _isCapturing = true);
    HapticFeedback.mediumImpact();

    try {
      // Thêm timeout để tránh bị treo
      final file = await _controller!.takePicture().timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('Chụp ảnh quá lâu');
        },
      );

      if (mounted && !_isDisposing) {
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

  Future<void> _openGallery() async {
    if (_isCapturing || !mounted) return;

    final provider = Provider.of<TransactionProvider>(context, listen: false);

    try {
      final picked = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1920,
      );
      if (picked != null && mounted && !_isDisposing) {
        _goToForm(imagePath: picked.path, provider: provider);
      }
    } catch (e) {
      debugPrint('Gallery pick error: $e');
      if (mounted) _showSnackBar('Không thể chọn ảnh');
    }
  }

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
            if (_errorMessage != null)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.7),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 48,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _errorMessage!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
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
              ),
          ],
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

  /// Hiển thị CameraPreview đúng tỷ lệ, crop thay vì stretch.
  /// Dùng LayoutBuilder để biết kích thước khung thực, rồi scale camera
  /// preview sao cho cover đầy khung — giống BoxFit.cover — không méo.
  Widget _buildFittedCameraPreview() {
    final controller = _controller!;
    final previewSize = controller.value.previewSize;
    if (previewSize == null) return CameraPreview(controller);

    // previewSize.width là cạnh DÀI (landscape), .height là cạnh NGẮN
    // Trong portrait: chiều rộng thực = previewSize.height, cao = previewSize.width
    final cameraW = previewSize.height; // chiều rộng sensor ở portrait
    final cameraH = previewSize.width; // chiều cao sensor ở portrait

    return LayoutBuilder(
      builder: (context, constraints) {
        final frameW = constraints.maxWidth;
        final frameH = constraints.maxHeight;

        // Scale để cover: chọn tỷ lệ scale lớn hơn giữa 2 chiều
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
                child: (_isInitialized && _controller != null)
                    ? _buildFittedCameraPreview()
                    : Container(
                        color: const Color(0xFF1C1C1E),
                        child: _isSwitching
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white38,
                                ),
                              )
                            : const Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircularProgressIndicator(
                                      color: Colors.white38,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Đang khởi tạo...',
                                      style: TextStyle(color: Colors.white54),
                                    ),
                                  ],
                                ),
                              ),
                      ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: _CameraIconButton(
                  icon: _isFlashOn
                      ? Icons.flash_on_rounded
                      : Icons.flash_off_rounded,
                  onTap: _toggleFlash,
                  isEnabled: !_isCapturing && _isInitialized,
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: _CameraIconButton(
                  icon: _isSwitching
                      ? Icons.sync
                      : Icons.flip_camera_ios_rounded,
                  onTap: _switchCamera,
                  isEnabled:
                      !_isCapturing && _cameras.length > 1 && !_isSwitching,
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
          _ShutterButton(isCapturing: _isCapturing, onTap: _captureAndProceed),
          const SizedBox(height: 55),
          SizedBox(
            height: 50,
            child: Center(
              child: ElevatedButton.icon(
                onPressed: _isCapturing || _isSwitching ? null : _openGallery,
                style:
                    ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      backgroundColor: const Color.fromARGB(0, 146, 6, 6),
                      foregroundColor: const Color.fromARGB(255, 234, 6, 135),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ).copyWith(
                      backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(255, 161, 5, 94).withOpacity(0.2),
                      ),
                      overlayColor: WidgetStateProperty.all(
                        const Color.fromARGB(
                          255,
                          255,
                          77,
                          77,
                        ).withOpacity(0.08),
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
            onPressed: _isCapturing || _isSwitching ? null : _skipPhoto,
            child: Text(
              'Bỏ qua ảnh',
              style: TextStyle(
                color: Colors.white.withOpacity(
                  (_isCapturing || _isSwitching) ? 0.25 : 0.55,
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

class _CameraIconButton extends StatelessWidget {
  const _CameraIconButton({
    required this.icon,
    required this.onTap,
    this.isEnabled = true,
  });
  final IconData icon;
  final VoidCallback onTap;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(isEnabled ? 0.35 : 0.15),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isEnabled ? Colors.white : Colors.white.withOpacity(0.5),
          size: 20,
        ),
      ),
    );
  }
}

class _ShutterButton extends StatelessWidget {
  const _ShutterButton({required this.isCapturing, required this.onTap});
  final bool isCapturing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isCapturing ? null : onTap,
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: isCapturing
              ? null
              : const SweepGradient(
                  colors: [
                    Color(0xFF6C63FF),
                    Color(0xFFE040FB),
                    Color(0xFFFF6B9D),
                    Color(0xFF6C63FF),
                  ],
                ),
          color: isCapturing ? Colors.grey.withOpacity(0.5) : null,
          boxShadow: isCapturing
              ? null
              : [
                  BoxShadow(
                    color: const Color(0xFF6C63FF).withOpacity(0.4),
                    blurRadius: 16,
                    spreadRadius: 2,
                  ),
                ],
        ),
        padding: const EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            color: isCapturing ? Colors.grey.withOpacity(0.3) : Colors.white,
            shape: BoxShape.circle,
          ),
          child: isCapturing
              ? const Padding(
                  padding: EdgeInsets.all(18),
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Color(0xFF6C63FF),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
