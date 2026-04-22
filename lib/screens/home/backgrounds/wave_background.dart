import 'package:flutter/material.dart';
import 'dart:math' as math;

class WaveBackground extends StatefulWidget {
  const WaveBackground({super.key});

  @override
  State<WaveBackground> createState() => _WaveBackgroundState();
}

class _WaveBackgroundState extends State<WaveBackground>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  // 🌊 sáng hơn nhưng vẫn deep blue
  final List<List<Color>> _gradients = [
    [Color(0xFF1E4F85), Color(0xFF0F2F4F)],
    [Color(0xFF25639A), Color(0xFF123B6A)],
    [Color(0xFF1F5A8C), Color(0xFF0F3554)],
    [Color(0xFF2A6FA8), Color(0xFF144264)],
  ];

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
      4,
      (i) => AnimationController(
        duration: Duration(seconds: 12 + i * 3),
        vsync: this,
      )..repeat(),
    );

    _animations = _controllers
        .map((c) => Tween<double>(begin: 0, end: 2 * math.pi).animate(c))
        .toList();
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 🌑 nền giữ tối nhưng nâng nhẹ blue
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF030617),
                Color(0xFF071021),
                Color(0xFF020412),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),

        // 🌊 waves
        ...List.generate(4, (index) {
          return AnimatedBuilder(
            animation: _animations[index],
            builder: (_, __) {
              return CustomPaint(
                painter: WavePainter(
                  progress: _animations[index].value,
                  gradient: _gradients[index],
                  waveIndex: index,
                ),
                size: Size.infinite,
              );
            },
          );
        }),

        // 🧊 giảm overlay để sáng hơn
        Container(
          color: Colors.black.withOpacity(0.08),
        ),
      ],
    );
  }
}

class WavePainter extends CustomPainter {
  final double progress;
  final List<Color> gradient;
  final int waveIndex;

  WavePainter({
    required this.progress,
    required this.gradient,
    required this.waveIndex,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();

    final baseHeight = size.height * (0.35 + waveIndex * 0.12);

    path.moveTo(0, size.height);
    path.lineTo(0, size.height - baseHeight);

    for (double x = 0; x <= size.width; x++) {
      final normalized = x / size.width;

      final y =
          math.sin(normalized * 6 + progress) * 12 +
          math.cos(normalized * 3 + progress * 1.5) * 6;

      path.lineTo(
        x,
        size.height - baseHeight + y * (1 + waveIndex * 0.25),
      );
    }

    path.lineTo(size.width, size.height);
    path.close();

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final paint = Paint()
      ..shader = LinearGradient(
        colors: gradient.map((c) => c.withOpacity(0.35)).toList(), // tăng nhẹ
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(rect)
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

    canvas.drawPath(path, paint);

    // ✨ highlight rõ hơn chút nhưng vẫn subtle
    final highlightPaint = Paint()
      ..color = Colors.white.withOpacity(0.06)
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    canvas.drawPath(path, highlightPaint);
  }

  @override
  bool shouldRepaint(covariant WavePainter oldDelegate) => true;
}