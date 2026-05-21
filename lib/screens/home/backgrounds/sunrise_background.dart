import 'package:flutter/material.dart';
import 'dart:math' as math;

class SunriseBackground extends StatefulWidget {
  const SunriseBackground({super.key});

  @override
  State<SunriseBackground> createState() => _SunriseBackgroundState();
}

class _SunriseBackgroundState extends State<SunriseBackground>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _cloudController;
  late AnimationController _particleController;

  late List<_Cloud> _clouds;
  late List<_Particle> _particles;

  @override
  void initState() {
    super.initState();

    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 24),
    )..repeat(reverse: true);

    _cloudController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    )
      ..addListener(_updateClouds)
      ..repeat();

    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )
      ..addListener(_updateParticles)
      ..repeat();

    final random = math.Random();

    _clouds = List.generate(10, (_) {
      return _Cloud(
        x: random.nextDouble(),
        y: random.nextDouble() * 0.45 + 0.18,
        size: random.nextDouble() * 60 + 45,
        speed: random.nextDouble() * 0.00012 + 0.00004,
        opacity: random.nextDouble() * 0.18 + 0.08,
      );
    });

    _particles = List.generate(18, (_) {
      return _Particle(
        x: random.nextDouble(),
        y: random.nextDouble(),
        radius: random.nextDouble() * 2 + 0.8,
        speed: random.nextDouble() * 0.00025 + 0.00008,
      );
    });
  }

  @override
  void dispose() {
    _mainController.dispose();
    _cloudController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  void _updateClouds() {
    for (var c in _clouds) {
      c.x += c.speed;

      if (c.x > 1.25) {
        c.x = -0.25;
      }
    }
  }

  void _updateParticles() {
    for (var p in _particles) {
      p.y -= p.speed;

      if (p.y < -0.1) {
        p.y = 1.1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Stack(
        children: [
          // SKY
          AnimatedBuilder(
            animation: _mainController,
            builder: (_, __) {
              final progress = _mainController.value;

              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.lerp(
                        const Color(0xFF04050B),
                        const Color(0xFF0A1630),
                        progress,
                      )!,
                      Color.lerp(
                        const Color(0xFF0B1220),
                        const Color(0xFF4A2D1D),
                        progress * 0.7,
                      )!,
                      Color.lerp(
                        const Color(0xFF141B2B),
                        const Color(0xFF6A4A28),
                        progress * 0.75,
                      )!,
                    ],
                  ),
                ),
              );
            },
          ),

          // SUN
          AnimatedBuilder(
            animation: _mainController,
            builder: (_, __) {
              final progress = _mainController.value;

              final y = 0.88 - progress * 0.22;
              final sunSize = 180.0 + progress * 15.0;

              return Positioned(
                top: MediaQuery.of(context).size.height * y,
                left: 0,
                right: 0,
                child: IgnorePointer(
                  child: CustomPaint(
                    painter: _SunGlowPainter(progress, sunSize),
                    size: Size(sunSize, sunSize),
                  ),
                ),
              );
            },
          ),

          // ATMOSPHERIC FOG
          IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0, 0.2),
                  radius: 1.1,
                  colors: [
                    Colors.orange.withOpacity(0.012),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // CLOUDS
          AnimatedBuilder(
            animation: _cloudController,
            builder: (_, __) {
              return IgnorePointer(
                child: CustomPaint(
                  painter: _CloudPainter(_clouds),
                  size: Size.infinite,
                ),
              );
            },
          ),

          // PARTICLES
          AnimatedBuilder(
            animation: _particleController,
            builder: (_, __) {
              return IgnorePointer(
                child: CustomPaint(
                  painter: _ParticlePainter(_particles),
                  size: Size.infinite,
                ),
              );
            },
          ),

          // DARK OVERLAY
          IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.28),
                    Colors.black.withOpacity(0.42),
                    Colors.black.withOpacity(0.62),
                  ],
                ),
              ),
            ),
          ),

          // MOUNTAINS
          IgnorePointer(
            child: CustomPaint(
              painter: _MountainPainter(),
              size: Size.infinite,
            ),
          ),
        ],
      ),
    );
  }
}

class _Cloud {
  double x;
  double y;
  double size;
  double speed;
  double opacity;

  _Cloud({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.opacity,
  });
}

class _Particle {
  double x;
  double y;
  double radius;
  double speed;

  _Particle({
    required this.x,
    required this.y,
    required this.radius,
    required this.speed,
  });
}

class _SunGlowPainter extends CustomPainter {
  final double value;
  final double sunSize;

  _SunGlowPainter(this.value, this.sunSize);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final glowIntensity = 0.16 + value * 0.08;

    // OUTER GLOW
    final outerGlow = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFFFFB74D).withOpacity(
            0.05 * glowIntensity,
          ),
          Colors.transparent,
        ],
        stops: const [0.0, 1.0],
      ).createShader(
        Rect.fromCircle(
          center: center,
          radius: radius * 1.2,
        ),
      );

    canvas.drawCircle(center, radius * 1.2, outerGlow);

    // MIDDLE GLOW
    final middleGlow = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFFFFCC80).withOpacity(
            0.04 * glowIntensity,
          ),
          Colors.transparent,
        ],
      ).createShader(
        Rect.fromCircle(
          center: center,
          radius: radius * 0.8,
        ),
      );

    canvas.drawCircle(center, radius * 0.8, middleGlow);

    // SUN CORE
    final core = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFFFFE0A3).withOpacity(0.16),
          const Color(0xFFFFC46B).withOpacity(0.10),
        ],
      ).createShader(
        Rect.fromCircle(
          center: center,
          radius: radius * 0.65,
        ),
      )
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        4,
      );

    canvas.drawCircle(center, radius * 0.62, core);

    // HIGHLIGHT
    final highlight = Paint()
      ..color = Colors.white.withOpacity(0.04)
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        3,
      );

    canvas.drawCircle(center, radius * 0.18, highlight);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _CloudPainter extends CustomPainter {
  final List<_Cloud> clouds;

  _CloudPainter(this.clouds);

  @override
  void paint(Canvas canvas, Size size) {
    for (var c in clouds) {
      final paint = Paint()
        ..color = const Color(0xFFE8EDF7).withOpacity(
          c.opacity * 0.35,
        )
        ..maskFilter = const MaskFilter.blur(
          BlurStyle.normal,
          14,
        );

      final dx = c.x * size.width;
      final dy = c.y * size.height;

      canvas.drawCircle(
        Offset(dx, dy),
        c.size,
        paint,
      );

      canvas.drawCircle(
        Offset(dx - c.size * 0.7, dy + 8),
        c.size * 0.82,
        paint,
      );

      canvas.drawCircle(
        Offset(dx + c.size * 0.7, dy + 8),
        c.size * 0.82,
        paint,
      );

      canvas.drawCircle(
        Offset(dx - c.size * 0.35, dy - 8),
        c.size * 0.58,
        paint,
      );

      canvas.drawCircle(
        Offset(dx + c.size * 0.35, dy - 8),
        c.size * 0.58,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;

  _ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    for (var p in particles) {
      final opacity = (0.18 - (p.y * 0.08)).clamp(0.03, 0.12);

      final paint = Paint()
        ..color = Colors.white.withOpacity(opacity);

      final offset = Offset(
        p.x * size.width,
        p.y * size.height,
      );

      canvas.drawCircle(
        offset,
        p.radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _MountainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF05070D).withOpacity(0.98),
          const Color(0xFF0A101A).withOpacity(0.95),
          const Color(0xFF121C29).withOpacity(0.92),
        ],
      ).createShader(
        Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ),
      );

    final path = Path();

    path.moveTo(0, size.height);

    path.lineTo(0, size.height * 0.72);

    path.quadraticBezierTo(
      size.width * 0.10,
      size.height * 0.58,
      size.width * 0.22,
      size.height * 0.68,
    );

    path.quadraticBezierTo(
      size.width * 0.38,
      size.height * 0.44,
      size.width * 0.52,
      size.height * 0.76,
    );

    path.quadraticBezierTo(
      size.width * 0.70,
      size.height * 0.38,
      size.width * 0.84,
      size.height * 0.62,
    );

    path.quadraticBezierTo(
      size.width * 0.92,
      size.height * 0.54,
      size.width,
      size.height * 0.68,
    );

    path.lineTo(size.width, size.height);

    path.close();

    canvas.drawPath(path, paint);

    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.32)
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        8,
      );

    canvas.drawPath(path, shadowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}