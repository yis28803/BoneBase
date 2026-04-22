import 'package:flutter/material.dart';
import 'dart:math' as math;

class StarFieldBackground extends StatefulWidget {
  const StarFieldBackground({super.key});

  @override
  State<StarFieldBackground> createState() => _StarFieldBackgroundState();
}

class _StarFieldBackgroundState extends State<StarFieldBackground>
    with TickerProviderStateMixin {
  late List<_Star> _stars;
  late AnimationController _controller;

  final int _starCount = 180;

  // 🌠 Shooting star system
  late _ShootingStar _shootingStar;
  double _lastSpawnTime = 0;
  final double _cooldown = 60.0; // 60 seconds

  @override
  void initState() {
    super.initState();
    final random = math.Random();

    _stars = List.generate(_starCount, (_) {
      final colors = [
        const Color(0xFFFFD700),
        const Color(0xFFB8B8FF),
        const Color(0xFF8BE9FD),
        const Color(0xFFFF9BD2),
      ];

      return _Star(
        x: random.nextDouble(),
        y: random.nextDouble(),
        size: random.nextDouble() * 1.8 + 0.4,
        twinkleSpeed: random.nextDouble() * 2 + 0.5,
        twinkleOffset: random.nextDouble() * math.pi * 2,
        brightness: random.nextDouble(),
        depth: random.nextDouble() * 1.5 + 0.5,
        tint: colors[random.nextInt(colors.length)],
      );
    });

    _shootingStar = _ShootingStar(start: Offset.zero, end: Offset.zero);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateShootingStar(double time, Size size) {
    final random = math.Random();

    if (!_shootingStar.active) {
      if (time - _lastSpawnTime > _cooldown) {
        final start = Offset(
          random.nextDouble() * size.width,
          random.nextDouble() * size.height * 0.3,
        );

        final end = Offset(
          random.nextDouble() * size.width,
          random.nextDouble() * size.height,
        );

        _shootingStar = _ShootingStar(
          start: start,
          end: end,
          progress: 0,
          active: true,
        );

        _lastSpawnTime = time;
      }
    } else {
      _shootingStar.progress += 0.02;

      if (_shootingStar.progress >= 1) {
        _shootingStar.active = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final size = MediaQuery.of(context).size;

        final elapsedTime =
            _controller.lastElapsedDuration?.inMilliseconds.toDouble() ?? 0;

        _updateShootingStar(elapsedTime / 1000.0, size);

        return CustomPaint(
          painter: StarFieldPainter(
            stars: _stars,
            time: _controller.value,
            shootingStar: _shootingStar,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

// ⭐ Star model
class _Star {
  double x, y, size, twinkleSpeed, twinkleOffset, brightness, depth;
  Color tint;

  _Star({
    required this.x,
    required this.y,
    required this.size,
    required this.twinkleSpeed,
    required this.twinkleOffset,
    required this.brightness,
    required this.depth,
    required this.tint,
  });
}

// 🌠 Shooting star model
class _ShootingStar {
  Offset start;
  Offset end;
  double progress;
  bool active;

  _ShootingStar({
    required this.start,
    required this.end,
    this.progress = 0,
    this.active = false,
  });
}

// 🎨 Painter
class StarFieldPainter extends CustomPainter {
  final List<_Star> stars;
  final double time;
  final _ShootingStar shootingStar;

  StarFieldPainter({
    required this.stars,
    required this.time,
    required this.shootingStar,
  });

  @override
  void paint(Canvas canvas, Size size) {
    /// 🌌 Background
    final bgPaint = Paint()
      ..shader = const RadialGradient(
        center: Alignment(0, -0.3),
        radius: 1.5,
        colors: [
          Color(0xFF0A0F2C),
          Color(0xFF1B1F4B),
          Color(0xFF090C1F),
          Color(0xFF05070F),
        ],
        stops: [0.0, 0.4, 0.75, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Offset.zero & size, bgPaint);

    /// 🌫️ Nebula
    final nebulaPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(-0.4, 0.2),
        radius: 1.2,
        colors: [
          const Color(0xFF6C63FF).withOpacity(0.15),
          const Color(0xFF00E5FF).withOpacity(0.08),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Offset.zero & size, nebulaPaint);

    /// ⭐ Stars
    for (var star in stars) {
      final twinkle =
          (math.sin(
                time * math.pi * 2 * star.twinkleSpeed + star.twinkleOffset,
              ) +
              1) /
          2;

      final opacity = star.brightness * (0.3 + twinkle * 0.7);

      final dx =
          math.sin(time * 2 * math.pi + star.twinkleOffset) *
          0.002 *
          star.depth;
      final dy =
          math.cos(time * 2 * math.pi + star.twinkleOffset) *
          0.002 *
          star.depth;

      final offset = Offset(
        (star.x + dx) * size.width,
        (star.y + dy) * size.height,
      );

      final corePaint = Paint()..color = Colors.white.withOpacity(opacity);

      canvas.drawCircle(offset, star.size, corePaint);

      final glowPaint = Paint()
        ..color = star.tint.withOpacity(opacity * 0.6)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, star.size * 4);

      canvas.drawCircle(offset, star.size * 2.5, glowPaint);

      if (star.brightness > 0.85) {
        final sparklePaint = Paint()
          ..color = Colors.white.withOpacity(opacity)
          ..strokeWidth = 0.8;

        final length = star.size * 4;

        canvas.drawLine(
          offset.translate(-length, 0),
          offset.translate(length, 0),
          sparklePaint,
        );

        canvas.drawLine(
          offset.translate(0, -length),
          offset.translate(0, length),
          sparklePaint,
        );
      }
    }

    /// 🌠 Shooting star (NEW SYSTEM)
    if (shootingStar.active) {
      final current = Offset.lerp(
        shootingStar.start,
        shootingStar.end,
        shootingStar.progress,
      )!;

      final tail = Offset.lerp(current, shootingStar.start, 0.5)!;

      final paint = Paint()
        ..shader = LinearGradient(
          colors: [Colors.white.withOpacity(0.9), Colors.transparent],
        ).createShader(Rect.fromPoints(tail, current))
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round;

      canvas.drawLine(tail, current, paint);
    }
  }

  @override
  bool shouldRepaint(covariant StarFieldPainter oldDelegate) => true;
}
