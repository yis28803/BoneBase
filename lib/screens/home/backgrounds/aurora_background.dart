import 'package:flutter/material.dart';
import 'dart:math' as math;

class AuroraBackground extends StatefulWidget {
  const AuroraBackground({super.key});

  @override
  State<AuroraBackground> createState() => _AuroraBackgroundState();
}

class _AuroraBackgroundState extends State<AuroraBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late List<Offset> stars;
  late List<double> starSizes;

  late List<ShootingStar> shootingStars;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(
          vsync: this,
          duration: const Duration(days: 1),
        )..repeat();

    final random = math.Random();

    stars = List.generate(
      35,
      (_) => Offset(
        random.nextDouble(),
        random.nextDouble() * 0.72,
      ),
    );

    starSizes = List.generate(
      35,
      (_) => random.nextDouble() * 1.2 + 0.4,
    );

    shootingStars = List.generate(
      2,
      (_) => ShootingStar.random(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double get time =>
      (_controller.lastElapsedDuration?.inMilliseconds ?? 0) / 1000;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Stack(
            children: [
              const SkyGradient(),

              // STARS
              RepaintBoundary(
                child: CustomPaint(
                  painter: StarPainter(
                    time,
                    stars,
                    starSizes,
                  ),
                  size: Size.infinite,
                ),
              ),

              // SHOOTING STARS
              RepaintBoundary(
                child: CustomPaint(
                  painter: ShootingStarPainter(
                    time,
                    shootingStars,
                  ),
                  size: Size.infinite,
                ),
              ),

              // AURORA
              RepaintBoundary(
                child: CustomPaint(
                  painter: AuroraPainter(time),
                  size: Size.infinite,
                ),
              ),

              // BACK MOUNTAIN
              CustomPaint(
                painter: MountainPainter(
                  offset: 0.03,
                  opacity: 0.45,
                ),
                size: Size.infinite,
              ),

              // FRONT MOUNTAIN
              CustomPaint(
                painter: MountainPainter(
                  offset: 0.06,
                  opacity: 0.88,
                ),
                size: Size.infinite,
              ),

              // REFLECTION
              RepaintBoundary(
                child: CustomPaint(
                  painter: ReflectionPainter(time),
                  size: Size.infinite,
                ),
              ),

              // MIST
              RepaintBoundary(
                child: CustomPaint(
                  painter: MistPainter(time),
                  size: Size.infinite,
                ),
              ),

              // DARK OVERLAY
              IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.08),
                        Colors.black.withOpacity(0.14),
                        Colors.black.withOpacity(0.32),
                        Colors.black.withOpacity(0.55),
                        Colors.black.withOpacity(0.82),
                      ],
                      stops: const [
                        0.0,
                        0.38,
                        0.58,
                        0.8,
                        1.0,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

////////////////////////////////////////////////////////
/// SKY
////////////////////////////////////////////////////////

class SkyGradient extends StatelessWidget {
  const SkyGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF01030A),
            Color(0xFF02050F),
            Color(0xFF000000),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////
/// AURORA
////////////////////////////////////////////////////////

class AuroraPainter extends CustomPainter {
  final double time;

  AuroraPainter(this.time);

  double noise(double x) {
    return math.sin(x) +
        math.sin(x * 0.5) * 0.5 +
        math.cos(x * 0.25) * 0.25 +
        math.sin(x * 2) * 0.15;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) {
      return;
    }

    final baseY = size.height * 0.24;

    final rect = Rect.fromLTWH(
      0,
      0,
      size.width,
      size.height,
    );

    // PREMIUM MULTI-COLOR AURORA
    final gradient = LinearGradient(
      colors: [
        const Color(0xFF00FF9C).withOpacity(0.26),
        const Color(0xFF00FFD5).withOpacity(0.24),
        const Color(0xFF00E5FF).withOpacity(0.22),
        const Color(0xFF4CC9F0).withOpacity(0.20),
        const Color(0xFF3A86FF).withOpacity(0.22),
        const Color(0xFF5A5CFF).withOpacity(0.18),
        const Color(0xFF8338EC).withOpacity(0.20),
        const Color(0xFFB5179E).withOpacity(0.18),
        const Color(0xFFFF006E).withOpacity(0.14),
        const Color(0xFFFFBE0B).withOpacity(0.10),
        const Color(0xFF00FF9C).withOpacity(0.24),
      ],
      begin: Alignment(-1.5 + time * 0.03, 0),
      end: Alignment(1 + time * 0.03, 0),
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 48
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        18,
      );

    final glow = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 105
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        32,
      );

    for (int layer = 0; layer < 2; layer++) {
      final path = Path();

      path.moveTo(
        0,
        baseY + layer * 22,
      );

      for (double x = 0; x <= size.width; x++) {
        final nx = x / size.width;

        final wave = noise(
          nx * 6 + time * (0.18 + layer * 0.05),
        );

        path.lineTo(
          x,
          baseY + wave * 24 + layer * 22,
        );
      }

      canvas.drawPath(path, glow);
      canvas.drawPath(path, paint);

      final curtain = Paint()
        ..color = Colors.white.withOpacity(0.025);

      for (double x = 0; x <= size.width; x += 16) {
        final nx = x / size.width;

        final wave = noise(nx * 6 + time * 0.2);

        final y = baseY + wave * 42 + layer * 22;

        canvas.drawLine(
          Offset(x, y),
          Offset(
            x,
            y + 85 + noise(nx * 8) * 24,
          ),
          curtain,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

////////////////////////////////////////////////////////
/// STARS
////////////////////////////////////////////////////////

class StarPainter extends CustomPainter {
  final double time;
  final List<Offset> stars;
  final List<double> sizes;

  StarPainter(
    this.time,
    this.stars,
    this.sizes,
  );

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) {
      return;
    }

    final paint = Paint();

    for (int i = 0; i < stars.length; i++) {
      final twinkle = (math.sin(time * 1.6 + i) + 1) / 2;

      paint.color = Colors.white.withOpacity(
        0.08 + twinkle * 0.22,
      );

      canvas.drawCircle(
        Offset(
          stars[i].dx * size.width,
          stars[i].dy * size.height,
        ),
        sizes[i] + twinkle * 0.5,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

////////////////////////////////////////////////////////
/// SHOOTING STAR
////////////////////////////////////////////////////////

class ShootingStar {
  double startX;
  double startY;
  double speed;

  ShootingStar(
    this.startX,
    this.startY,
    this.speed,
  );

  factory ShootingStar.random() {
    final r = math.Random();

    return ShootingStar(
      r.nextDouble(),
      r.nextDouble() * 0.45,
      0.08 + r.nextDouble() * 0.12,
    );
  }
}

class ShootingStarPainter extends CustomPainter {
  final double time;
  final List<ShootingStar> stars;

  ShootingStarPainter(
    this.time,
    this.stars,
  );

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) {
      return;
    }

    final paint = Paint()
      ..color = Colors.white.withOpacity(0.35)
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        2,
      );

    for (var s in stars) {
      final x =
          (s.startX * size.width + time * s.speed * 220) %
          size.width;

      final y = s.startY * size.height;

      const tailLength = 28.0;

      canvas.drawLine(
        Offset(x, y),
        Offset(
          x - tailLength,
          y + tailLength * 0.45,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

////////////////////////////////////////////////////////
/// MOUNTAIN
////////////////////////////////////////////////////////

class MountainPainter extends CustomPainter {
  final double offset;
  final double opacity;

  MountainPainter({
    required this.offset,
    required this.opacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) {
      return;
    }

    final path = Path();

    path.moveTo(0, size.height);

    path.lineTo(0, size.height * 0.76);

    for (double x = 0; x <= size.width; x++) {
      final nx = x / size.width;

      final h =
          math.sin(nx * 5) * 28 +
          math.sin(nx * 1.8) * 52;

      path.lineTo(
        x,
        size.height * (0.76 - offset) - h,
      );
    }

    path.lineTo(size.width, size.height);
    path.close();

    final paint = Paint()
      ..color = const Color(0xFF020202).withOpacity(opacity);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

////////////////////////////////////////////////////////
/// REFLECTION
////////////////////////////////////////////////////////

class ReflectionPainter extends CustomPainter {
  final double time;

  ReflectionPainter(this.time);

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) {
      return;
    }

    final rect = Rect.fromLTWH(
      0,
      size.height * 0.76,
      size.width,
      size.height * 0.24,
    );

    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.cyan.withOpacity(0.025),
          Colors.transparent,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(rect)
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        14,
      );

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

////////////////////////////////////////////////////////
/// MIST
////////////////////////////////////////////////////////

class MistPainter extends CustomPainter {
  final double time;

  MistPainter(this.time);

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) {
      return;
    }

    final rect = Rect.fromLTWH(
      0,
      size.height * 0.7,
      size.width,
      size.height * 0.3,
    );

    final opacity =
        (0.02 + math.sin(time * 0.18) * 0.01)
            .clamp(0.01, 0.03);

    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.white.withOpacity(opacity),
          Colors.transparent,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(rect);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}