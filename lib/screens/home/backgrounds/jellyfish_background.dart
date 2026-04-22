import 'package:flutter/material.dart';
import 'dart:math' as math;

class JellyfishUltraBackground extends StatefulWidget {
  const JellyfishUltraBackground({super.key});

  @override
  State<JellyfishUltraBackground> createState() =>
      _JellyfishUltraBackgroundState();
}

class _JellyfishUltraBackgroundState extends State<JellyfishUltraBackground>
    with TickerProviderStateMixin {
  late List<_Jellyfish> _jellyfish;
  late List<_Bubble> _bubbles;
  late AnimationController _controller;

  final int _jellyfishCount = 10;
  final int _bubbleCount = 40;

  @override
  void initState() {
    super.initState();
    final random = math.Random();

    final colors2026 = [
      const Color(0xFF00F5FF),
      const Color(0xFF7B61FF),
      const Color(0xFFFF4ECD),
      const Color(0xFF00FFA3),
      const Color(0xFFFFB800),
      const Color(0xFF5BFF6A),
      const Color(0xFF4D9FFF),
      const Color(0xFFFF6B6B),
    ];

    _jellyfish = List.generate(
      _jellyfishCount,
      (_) => _Jellyfish(
        x: random.nextDouble(),
        y: random.nextDouble(),
        vx: (random.nextDouble() - 0.5) * 0.0009,
        vy: (random.nextDouble() - 0.5) * 0.0007 - 0.00025,
        size: random.nextDouble() * 50 + 60,
        pulseOffset: random.nextDouble() * math.pi * 2,
        color: colors2026[random.nextInt(colors2026.length)],
      ),
    );

    _bubbles = List.generate(
      _bubbleCount,
      (_) => _Bubble(
        x: random.nextDouble(),
        y: random.nextDouble(),
        speed: random.nextDouble() * 0.001 + 0.0003,
        size: random.nextDouble() * 6 + 2,
      ),
    );

    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..addListener(() {
        _update();
      })
      ..repeat();
  }

  void _update() {
    for (var j in _jellyfish) {
      j.x += j.vx;
      j.y += j.vy;

      if (j.x < -0.2) j.x = 1.2;
      if (j.x > 1.2) j.x = -0.2;
      if (j.y < -0.2) j.y = 1.2;
      if (j.y > 1.2) j.y = -0.2;
    }

    for (var b in _bubbles) {
      b.y -= b.speed;
      if (b.y < -0.1) {
        b.y = 1.1;
        b.x = math.Random().nextDouble();
      }
    }
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
        painter: _UltraPainter(
          jellyfish: _jellyfish,
          bubbles: _bubbles,
          time: _controller.value,
        ),
        size: Size.infinite,
      ),
    );
  }
}

class _Jellyfish {
  double x, y, vx, vy, size, pulseOffset;
  Color color;

  _Jellyfish({
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.size,
    required this.pulseOffset,
    required this.color,
  });
}

class _Bubble {
  double x, y, speed, size;

  _Bubble({
    required this.x,
    required this.y,
    required this.speed,
    required this.size,
  });
}

class _UltraPainter extends CustomPainter {
  final List<_Jellyfish> jellyfish;
  final List<_Bubble> bubbles;
  final double time;

  _UltraPainter({
    required this.jellyfish,
    required this.bubbles,
    required this.time,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final bgPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF020617),
          const Color(0xFF0A1F44),
          const Color(0xFF020617),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Offset.zero & size, bgPaint);

    // Light rays
    final rayPaint = Paint()
      ..color = Colors.white.withOpacity(0.03);

    for (int i = 0; i < 6; i++) {
      final x = size.width * (i / 6);
      canvas.drawRect(Rect.fromLTWH(x, 0, 40, size.height), rayPaint);
    }

    // Bubbles
    for (var b in bubbles) {
      final paint = Paint()
        ..color = Colors.white.withOpacity(0.15);
      canvas.drawCircle(
        Offset(b.x * size.width, b.y * size.height),
        b.size,
        paint,
      );
    }

    // Jellyfish
    for (var j in jellyfish) {
      final pulse = (math.sin(time * math.pi * 2 + j.pulseOffset) + 1) / 2;
      final scale = 1 + pulse * 0.2;

      canvas.save();
      canvas.translate(j.x * size.width, j.y * size.height);
      canvas.scale(scale);

      final bellPaint = Paint()
        ..color = j.color.withOpacity(0.35 + pulse * 0.3)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

      final path = Path();
      path.moveTo(-j.size / 2, 0);
      path.quadraticBezierTo(-j.size / 2, -j.size / 2, 0, -j.size / 2);
      path.quadraticBezierTo(j.size / 2, -j.size / 2, j.size / 2, 0);
      path.quadraticBezierTo(0, j.size / 3, -j.size / 2, 0);
      path.close();

      canvas.drawPath(path, bellPaint);

      final tentaclePaint = Paint()
        ..color = j.color.withOpacity(0.25 + pulse * 0.25)
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round;

      for (int i = -4; i <= 4; i++) {
        final tPath = Path();
        final startX = i * j.size / 9;
        tPath.moveTo(startX, 0);

        for (int k = 1; k <= 6; k++) {
          final wave = math.sin(time * 6 + k + j.pulseOffset) * 6;
          tPath.lineTo(startX + wave * 0.4, k * j.size / 6);
        }

        canvas.drawPath(tPath, tentaclePaint);
      }

      final glow = Paint()
        ..color = j.color.withOpacity(0.6)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);

      canvas.drawCircle(Offset(0, -j.size / 6), j.size / 3, glow);

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
