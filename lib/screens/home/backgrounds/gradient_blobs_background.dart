import 'package:flutter/material.dart';

class GradientBlobsBackground extends StatefulWidget {
  const GradientBlobsBackground({super.key});

  @override
  State<GradientBlobsBackground> createState() => _GradientBlobsBackgroundState();
}

class _GradientBlobsBackgroundState extends State<GradientBlobsBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller1, _controller2, _controller3;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat(reverse: true);
    _controller2 = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(reverse: true);
    _controller3 = AnimationController(
      duration: const Duration(seconds: 12),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Base dark background
        Container(color: Colors.black),

        // Animated gradient blobs - Blob 1 (Tím)
        AnimatedBuilder(
          animation: _controller1,
          builder: (_, __) => Positioned(
            left: -50 + _controller1.value * 100,
            top: -50 + _controller1.value * 150,
            child: _GradientBlob(
              color: const Color(0xFF6C63FF),
              size: 250,
              blur: 100,
            ),
          ),
        ),

        // Blob 2 (Xanh Cyan)
        AnimatedBuilder(
          animation: _controller2,
          builder: (_, __) => Positioned(
            right: -80 + _controller2.value * 120,
            top: 100 + _controller2.value * 100,
            child: _GradientBlob(
              color: const Color(0xFF00D9FF),
              size: 200,
              blur: 80,
            ),
          ),
        ),

        // Blob 3 (Đỏ/Hồng)
        AnimatedBuilder(
          animation: _controller3,
          builder: (_, __) => Positioned(
            left: 100 + _controller3.value * 80,
            bottom: -60 + _controller3.value * 100,
            child: _GradientBlob(
              color: const Color(0xFFFF6B6B),
              size: 180,
              blur: 70,
            ),
          ),
        ),

        // Overlay to dim the blobs
        Container(color: Colors.black.withOpacity(0.7)),
      ],
    );
  }
}

class _GradientBlob extends StatelessWidget {
  final Color color;
  final double size;
  final double blur;

  const _GradientBlob({
    required this.color,
    required this.size,
    required this.blur,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.3),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: blur,
            spreadRadius: blur / 3,
          ),
        ],
      ),
    );
  }
}
