import 'package:flutter/material.dart';
import 'dart:math' as math;

class DeerForestBackground extends StatefulWidget {
  const DeerForestBackground({super.key});

  @override
  State<DeerForestBackground> createState() => _DeerForestBackgroundState();
}

class _DeerForestBackgroundState extends State<DeerForestBackground>
    with TickerProviderStateMixin {
  late List<_Tree> _trees;
  late _Deer _deer;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    final random = math.Random();

    _trees = List.generate(
      18,
      (_) => _Tree(
        x: random.nextDouble(),
        size: random.nextDouble() * 30 + 40,
        depth: random.nextDouble(),
        swaySeed: random.nextDouble() * 10,
      ),
    );

    _deer = _Deer(x: -0.3, y: 0.65, speed: 0.0003);

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 20))
          ..addListener(_update)
          ..repeat();
  }

  void _update() {
    _deer.x += _deer.speed;
    if (_deer.x > 1.2) _deer.x = -0.3;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => CustomPaint(
        painter: DeerForestPainter(
          trees: _trees,
          deer: _deer,
          time: _controller.value,
        ),
        size: Size.infinite,
      ),
    );
  }
}

class _Tree {
  double x, size, depth, swaySeed;
  _Tree({
    required this.x,
    required this.size,
    required this.depth,
    required this.swaySeed,
  });
}

class _Deer {
  double x, y, speed;
  _Deer({required this.x, required this.y, required this.speed});
}

class DeerForestPainter extends CustomPainter {
  final List<_Tree> trees;
  final _Deer deer;
  final double time;

  DeerForestPainter({
    required this.trees,
    required this.deer,
    required this.time,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _drawBackground(canvas, size);
    _drawLightGlow(canvas, size);
    _drawFog(canvas, size);
    _drawTrees(canvas, size);
    _drawDeer(canvas, size);
    _drawFireflies(canvas, size);
  }

  /// 🌌 Gradient + cinematic lighting
  void _drawBackground(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final gradient = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF050B0A),
          const Color(0xFF0F2A1F),
          const Color(0xFF071512),
        ],
      ).createShader(rect);

    canvas.drawRect(rect, gradient);
  }

  /// 💡 God light
  void _drawLightGlow(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.7, size.height * 0.2);

    final glow = Paint()
      ..shader = RadialGradient(
        colors: [const Color(0xFF6CFFB2).withOpacity(0.25), Colors.transparent],
      ).createShader(Rect.fromCircle(center: center, radius: 300));

    canvas.drawCircle(center, 300, glow);
  }

  /// 🌫 Fog animation (key premium effect)
  void _drawFog(Canvas canvas, Size size) {
    for (int i = 0; i < 3; i++) {
      final y = size.height * (0.4 + i * 0.1);
      final dx = math.sin(time * 2 + i) * 40;

      final rect = Rect.fromLTWH(-50 + dx, y, size.width + 100, 80);

      final fog = Paint()
        ..shader = LinearGradient(
          colors: [
            Colors.white.withOpacity(0.05),
            Colors.white.withOpacity(0.02),
            Colors.transparent,
          ],
        ).createShader(rect);

      canvas.drawRect(rect, fog);
    }
  }

  /// 🌲 Trees with sway + parallax
  void _drawTrees(Canvas canvas, Size size) {
    for (var tree in trees) {
      final depthFactor = 0.5 + tree.depth * 0.7;

      final sway = math.sin(time * 2 + tree.swaySeed) * 4 * tree.depth;

      final x = tree.x * size.width + sway;
      final y = size.height * 0.7;

      final w = tree.size * depthFactor;
      final h = tree.size * 2.2 * depthFactor;

      final paint = Paint()
        ..color = Color.lerp(
          const Color(0xFF112A1D),
          const Color(0xFF2E6B4F),
          tree.depth,
        )!.withOpacity(0.5 + tree.depth * 0.4);

      final path = Path();
      path.moveTo(x, y);
      path.lineTo(x - w / 2, y - h);
      path.lineTo(x + w / 2, y - h);
      path.close();

      canvas.drawPath(path, paint);
    }
  }

  /// 🦌 Deer with glow + animation
  void _drawDeer(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(deer.x * size.width, deer.y * size.height);

    final glow = Paint()
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8)
      ..color = const Color(0xFFFFD8A8).withOpacity(0.25);

    canvas.drawCircle(const Offset(0, -10), 30, glow);

    final bodyPaint = Paint()..color = const Color(0xFFB08968);

    final body = Path();
    body.moveTo(-20, 0);
    body.quadraticBezierTo(-10, -12, 10, -8);
    body.quadraticBezierTo(22, -4, 20, 0);
    body.quadraticBezierTo(10, 10, -10, 10);
    body.close();

    canvas.drawPath(body, bodyPaint);

    final legOffset = math.sin(time * math.pi * 4) * 5;

    final legPaint = Paint()
      ..color = const Color(0xFF8B7355)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(-8, 5), Offset(-8 - legOffset, 20), legPaint);
    canvas.drawLine(Offset(8, 5), Offset(8 + legOffset, 20), legPaint);

    canvas.restore();
  }

  /// ✨ Fireflies upgraded (particle style)
  void _drawFireflies(Canvas canvas, Size size) {
    for (int i = 0; i < 20; i++) {
      final x = (math.sin(time * 2 + i) + 1) / 2 * size.width;
      final y =
          (math.cos(time * 2 + i * 1.5) + 1) / 2 * size.height * 0.5 +
          size.height * 0.2;

      final opacity = (math.sin(time * 3 + i) + 1) / 2;

      final glow = Paint()
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6)
        ..color = const Color(0xFFB7FFEA).withOpacity(0.3);

      final core = Paint()
        ..color = const Color(0xFF00FFC6).withOpacity(0.6 + opacity * 0.4);

      canvas.drawCircle(Offset(x, y), 6, glow);
      canvas.drawCircle(Offset(x, y), 2, core);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
