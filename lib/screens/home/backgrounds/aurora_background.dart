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
        AnimationController(vsync: this, duration: const Duration(days: 1))
          ..repeat();

    final random = math.Random();

    stars = List.generate(
      60,
      (_) => Offset(random.nextDouble(), random.nextDouble() * 0.75),
    );

    starSizes = List.generate(60, (_) => random.nextDouble() * 1.5 + 0.5);

    shootingStars = List.generate(3, (_) => ShootingStar.random());
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Stack(
          children: [
            const SkyGradient(),

            CustomPaint(
              painter: StarPainter(time, stars, starSizes),
              size: Size.infinite,
            ),

            CustomPaint(
              painter: ShootingStarPainter(time, shootingStars),
              size: Size.infinite,
            ),

            CustomPaint(
              painter: AuroraPainter(time),
              size: Size.infinite,
            ),

            CustomPaint(
              painter: MountainPainter(offset: 0.02, opacity: 0.4),
              size: Size.infinite,
            ),

            CustomPaint(
              painter: MountainPainter(offset: 0.05, opacity: 0.85),
              size: Size.infinite,
            ),

            CustomPaint(
              painter: ReflectionPainter(time),
              size: Size.infinite,
            ),

            CustomPaint(
              painter: MistPainter(time),
              size: Size.infinite,
            ),

            IgnorePointer(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Color(0x88000000),
                      Color(0xCC000000),
                      Color(0xFF000000),
                    ],
                    stops: [0.0, 0.45, 0.65, 0.85, 1.0],
                  ),
                ),
              ),
            )
          ],
        );
      },
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
          colors: [Color(0xFF020412), Color(0xFF000000)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////
/// AURORA PREMIUM
////////////////////////////////////////////////////////

class AuroraPainter extends CustomPainter {
  final double time;

  AuroraPainter(this.time);

  double noise(double x) {
    return math.sin(x) +
        math.sin(x * 0.5) * 0.5 +
        math.cos(x * 0.25) * 0.25 +
        math.sin(x * 2) * 0.2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final baseY = size.height * 0.26;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final gradient = LinearGradient(
      colors: const [
        Color(0xFF00FF9C),
        Color(0xFF00FFD5),
        Color(0xFF00CFFF),
        Color(0xFF3A86FF),
        Color(0xFF8338EC),
        Color(0xFFFF006E),
        Color(0xFFFFBE0B),
        Color(0xFF00FF9C),
      ],
      begin: Alignment(-2 + time * 0.05, 0),
      end: Alignment(time * 0.05, 0),
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 65
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 45);

    final glow = Paint()
      ..shader = gradient
          .scale(1)
          .createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 160
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 90);

    for (int layer = 0; layer < 2; layer++) {
      final path = Path();

      path.moveTo(0, baseY + layer * 25);

      for (double x = 0; x <= size.width; x++) {
        final nx = x / size.width;

        final wave = noise(nx * 6 + time * (0.3 + layer * 0.1));

        path.lineTo(x, baseY + wave * 30 + layer * 25);
      }

      canvas.drawPath(path, glow);
      canvas.drawPath(path, paint);

      final curtain = Paint()
        ..color = Colors.white.withOpacity(0.05);

      for (double x = 0; x <= size.width; x += 8) {
        final nx = x / size.width;

        final wave = noise(nx * 6 + time * 0.3);

        final y = baseY + wave * 50 + layer * 25;

        canvas.drawLine(
          Offset(x, y),
          Offset(x, y + 120 + noise(nx * 10) * 50),
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

  StarPainter(this.time, this.stars, this.sizes);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    for (int i = 0; i < stars.length; i++) {
      final twinkle = (math.sin(time * 2 + i) + 1) / 2;

      paint.color = Colors.white.withOpacity(0.3 + twinkle * 0.7);

      canvas.drawCircle(
        Offset(stars[i].dx * size.width, stars[i].dy * size.height),
        sizes[i] + twinkle * 1.5,
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

  ShootingStar(this.startX, this.startY, this.speed);

  factory ShootingStar.random() {
    final r = math.Random();
    return ShootingStar(r.nextDouble(), r.nextDouble() * 0.5, 0.2 + r.nextDouble());
  }
}

class ShootingStarPainter extends CustomPainter {
  final double time;
  final List<ShootingStar> stars;

  ShootingStarPainter(this.time, this.stars);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2;

    for (var s in stars) {
      final x = (s.startX * size.width + time * s.speed * 300) % size.width;
      final y = s.startY * size.height;

      canvas.drawLine(
        Offset(x, y),
        Offset(x - 40, y + 20),
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

  MountainPainter({required this.offset, required this.opacity});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();

    path.moveTo(0, size.height * 0.75);

    for (double x = 0; x <= size.width; x++) {
      final nx = x / size.width;

      final h = math.sin(nx * 6) * 30 + math.sin(nx * 2) * 60;

      path.lineTo(x, size.height * (0.75 - offset) - h);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    final paint = Paint()..color = Colors.black.withOpacity(opacity);

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
    final rect = Rect.fromLTWH(
      0,
      size.height * 0.75,
      size.width,
      size.height * 0.25,
    );

    final paint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.white.withOpacity(0.05), Colors.transparent],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(rect)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 35);

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
    final rect = Rect.fromLTWH(
      0,
      size.height * 0.7,
      size.width,
      size.height * 0.3,
    );

    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.white.withOpacity(0.05 * (math.sin(time * 0.3) + 1)),
          Colors.transparent
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(rect);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}