import 'dart:async';
import 'package:flutter/material.dart';
import 'background_config.dart';

class BackgroundManager extends StatefulWidget {
  final Widget child;

  const BackgroundManager({super.key, required this.child});

  @override
  State<BackgroundManager> createState() => _BackgroundManagerState();
}

class _BackgroundManagerState extends State<BackgroundManager> {
  late BackgroundConfig _currentBackground;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _currentBackground = BackgroundTimeManager.getBackground();

    // Kiểm tra mỗi 60 giây — không dùng build() để tránh side-effect
    _timer = Timer.periodic(const Duration(seconds: 60), (_) {
      if (!mounted) return;
      final newBackground = BackgroundTimeManager.getBackground();
      if (newBackground.id != _currentBackground.id) {
        setState(() => _currentBackground = newBackground);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: _currentBackground.builder()),
        widget.child,
      ],
    );
  }
}
