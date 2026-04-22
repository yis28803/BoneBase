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
  late DateTime _lastCheckTime;

  @override
  void initState() {
    super.initState();

    // ✅ dùng API mới
    _currentBackground = BackgroundTimeManager.getBackground();
    _lastCheckTime = DateTime.now();
  }

  void _checkAndUpdateBackground() {
    final now = DateTime.now();

    // kiểm tra mỗi phút
    if (now.minute != _lastCheckTime.minute) {
      final newBackground = BackgroundTimeManager.getBackground();

      if (newBackground.id != _currentBackground.id) {
        setState(() {
          _currentBackground = newBackground;
        });
      }

      _lastCheckTime = now;
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkAndUpdateBackground();

    return Stack(
      children: [
        Positioned.fill(
          child: _currentBackground.builder(),
        ),
        widget.child,
      ],
    );
  }
}