import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

/// Mixin xử lý toàn bộ vòng đời và khởi tạo CameraController.
/// Sử dụng trong _CameraCaptureScreenState.
mixin CameraLifecycleMixin<T extends StatefulWidget>
    on State<T>, WidgetsBindingObserver {
  CameraController? cameraController;
  List<CameraDescription> cameras = [];

  int selectedCameraIndex = 0;
  bool isInitialized = false;
  bool isDisposing = false;
  bool isSwitching = false;
  bool isFlashOn = false;
  String? cameraErrorMessage;

  // ── Dispose ──────────────────────────────────────────────────────────────

  Future<void> disposeCamera() async {
    if (cameraController == null) return;

    final controller = cameraController!;
    cameraController = null;
    isInitialized = false;

    try {
      if (controller.value.isStreamingImages) {
        await controller.stopImageStream();
      }
      await Future.delayed(const Duration(milliseconds: 100));
      await controller.dispose();
    } catch (e) {
      debugPrint('Camera dispose error: $e');
    }
  }

  Future<void> stopCameraPreview() async {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return;
    }
    try {
      if (cameraController!.value.isStreamingImages) {
        await cameraController!.stopImageStream();
      }
    } catch (e) {
      debugPrint('Stop preview error: $e');
    }
  }

  // ── Lifecycle observer ────────────────────────────────────────────────────

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (isDisposing) return;

    final controller = cameraController;
    if (controller == null || !controller.value.isInitialized) return;

    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      stopCameraPreview();
    } else if (state == AppLifecycleState.resumed) {
      if (!isInitialized && !isDisposing && mounted) {
        initCamera(cameraIndex: selectedCameraIndex);
      }
    }
  }

  // ── Init ──────────────────────────────────────────────────────────────────

  Future<void> initCamera({int cameraIndex = 0}) async {
    if (isDisposing || !mounted) return;

    setState(() {
      isInitialized = false;
      cameraErrorMessage = null;
    });

    try {
      if (cameras.isEmpty) {
        cameras = await availableCameras();
        if (cameras.isEmpty) {
          throw Exception('Không tìm thấy camera nào trên thiết bị');
        }
      }

      final index = cameraIndex.clamp(0, cameras.length - 1);
      selectedCameraIndex = index;

      await disposeCamera();

      final controller = CameraController(
        cameras[index],
        ResolutionPreset.medium,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      cameraController = controller;
      await controller.initialize();

      if (isDisposing || !mounted) {
        await controller.dispose();
        return;
      }

      await controller.setFlashMode(
        isFlashOn ? FlashMode.torch : FlashMode.off,
      );

      if (mounted) setState(() => isInitialized = true);
    } catch (e) {
      debugPrint('Camera init error: $e');
      if (mounted) {
        setState(() {
          isInitialized = false;
          cameraErrorMessage = 'Không thể khởi tạo camera';
        });
      }
    }
  }

  // ── Switch ────────────────────────────────────────────────────────────────

  Future<void> switchCamera({
    required bool isCapturing,
    required VoidCallback onError,
  }) async {
    if (cameras.length < 2 || isCapturing || isSwitching || isDisposing) {
      return;
    }

    setState(() => isSwitching = true);

    try {
      final nextIndex = (selectedCameraIndex + 1) % cameras.length;
      await disposeCamera();
      await Future.delayed(const Duration(milliseconds: 300));
      if (!isDisposing && mounted) await initCamera(cameraIndex: nextIndex);
    } catch (e) {
      debugPrint('Switch camera error: $e');
      onError();
    } finally {
      if (mounted) setState(() => isSwitching = false);
    }
  }
}