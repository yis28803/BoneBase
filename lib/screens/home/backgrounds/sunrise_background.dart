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
      duration: const Duration(seconds: 22), // Tăng thời gian lên 22s
    )..repeat(reverse: true);

    _cloudController =
        AnimationController(vsync: this, duration: const Duration(seconds: 30))
          ..addListener(() {
            _updateClouds();
          })
          ..repeat();

    _particleController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..addListener(() {
            _updateParticles();
          })
          ..repeat();

    final random = math.Random();

    _clouds = List.generate(12, (_) {
      // Tăng số mây lên 12
      return _Cloud(
        x: random.nextDouble(),
        y: random.nextDouble() * 0.5 + 0.2, // Mây cao hơn
        size: random.nextDouble() * 70 + 40, // Mây to hơn
        speed: random.nextDouble() * 0.00018 + 0.00006,
        opacity: random.nextDouble() * 0.3 + 0.15, // Mây rõ hơn
      );
    });

    _particles = List.generate(50, (_) {
      // Tăng số hạt lên 50
      return _Particle(
        x: random.nextDouble(),
        y: random.nextDouble(),
        radius: random.nextDouble() * 2.5 + 1.2, // Hạt to hơn
        speed: random.nextDouble() * 0.0004 + 0.00015, // Di chuyển nhanh hơn
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
      if (c.x > 1.3) c.x = -0.3; // Điều chỉnh wrap-around
    }
  }

  void _updateParticles() {
    for (var p in _particles) {
      p.y -= p.speed;
      if (p.y < -0.15) p.y = 1.15; // Điều chỉnh wrap-around
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
                    // Bầu trời trên cùng - thay đổi nhiều hơn
                    Color.lerp(
                      const Color(0xFF0A0F2C),
                      const Color(0xFF1E3A8A),
                      progress,
                    )!,
                    // Bầu trời giữa - hiệu ứng mặt trời mọc mạnh hơn
                    Color.lerp(
                      const Color(0xFF1B2A49),
                      const Color(0xFFFF7B25), // Cam đậm hơn
                      progress * 1.2, // Tăng hệ số để màu cam xuất hiện sớm hơn
                    )!,
                    // Chân trời - vàng rực hơn
                    Color.lerp(
                      const Color(0xFF3A4A7A),
                      const Color(0xFFFFD166), // Vàng sáng hơn
                      progress * 1.4, // Tăng hệ số để màu vàng rõ hơn
                    )!,
                  ],
                ),
              ),
            );
          },
        ),

        AnimatedBuilder(
          animation: _mainController,
          builder: (_, __) {
            final progress = _mainController.value;
            // Mặt trời lên cao hơn: từ 0.75 xuống 0.25 (cao hơn 50%)
            final y = 0.75 - progress * 0.5;
            final sunSize =
                280.0 + progress * 40.0; // Mặt trời to dần khi lên cao

            return Positioned(
              top: MediaQuery.of(context).size.height * y,
              left: 0,
              right: 0,
              child: CustomPaint(
                painter: _SunGlowPainter(progress, sunSize),
                size: Size(sunSize, sunSize),
              ),
            );
          },
        ),

        AnimatedBuilder(
          animation: _cloudController,
          builder: (_, __) {
            return CustomPaint(
              painter: _CloudPainter(_clouds),
              size: Size.infinite,
            );
          },
        ),

        AnimatedBuilder(
          animation: _particleController,
          builder: (_, __) {
            return CustomPaint(
              painter: _ParticlePainter(_particles),
              size: Size.infinite,
            );
          },
        ),

        CustomPaint(painter: _MountainPainter(), size: Size.infinite),
      ],
    );
  }
}

class _Cloud {
  double x, y, size, speed, opacity;
  _Cloud({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.opacity,
  });
}

class _Particle {
  double x, y, radius, speed;
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

    // Hiệu ứng glow mạnh hơn khi mặt trời lên cao
    final glowIntensity = 0.7 + value * 0.3;

    // Lớp glow ngoài cùng - lớn hơn và sáng hơn
    final outerGlow = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFFFFE082).withOpacity(0.8 * glowIntensity),
          const Color(0xFFFFB74D).withOpacity(0.5 * glowIntensity),
          const Color(0xFFFF9800).withOpacity(0.2 * glowIntensity),
          Colors.transparent,
        ],
        stops: [0.0, 0.3, 0.6, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius * 2.2));

    canvas.drawCircle(center, radius * 2.2, outerGlow);

    // Lớp glow trung gian
    final middleGlow = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFFFFF176).withOpacity(0.9 * glowIntensity),
          const Color(0xFFFFD54F).withOpacity(0.6 * glowIntensity),
          Colors.transparent,
        ],
        stops: [0.0, 0.5, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius * 1.5));

    canvas.drawCircle(center, radius * 1.5, middleGlow);

    // Lõi mặt trời - sáng hơn
    final core = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.white.withOpacity(0.95),
          const Color(0xFFFFF59D).withOpacity(0.8),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius * 0.7))
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 35);

    canvas.drawCircle(center, radius * 0.7, core);

    // Điểm sáng trung tâm
    final highlight = Paint()
      ..color = Colors.white.withOpacity(0.9)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 15);

    canvas.drawCircle(center, radius * 0.4, highlight);
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
        ..color = Colors.white.withOpacity(c.opacity)
        ..maskFilter = const MaskFilter.blur(
          BlurStyle.normal,
          25,
        ); // Blur mạnh hơn

      final dx = c.x * size.width;
      final dy = c.y * size.height;

      // Vẽ đám mây với nhiều vòng tròn hơn để trông thực tế hơn
      canvas.drawCircle(Offset(dx, dy), c.size, paint);
      canvas.drawCircle(Offset(dx - c.size * 0.7, dy + 8), c.size * 0.8, paint);
      canvas.drawCircle(Offset(dx + c.size * 0.7, dy + 8), c.size * 0.8, paint);
      canvas.drawCircle(Offset(dx - c.size * 0.4, dy - 5), c.size * 0.6, paint);
      canvas.drawCircle(Offset(dx + c.size * 0.4, dy - 5), c.size * 0.6, paint);
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
      // Hạt sáng hơn và có opacity thay đổi theo vị trí
      final opacity = 0.7 - (p.y * 0.3); // Hạt trên cao sáng hơn
      final paint = Paint()
        ..color = Colors.white.withOpacity(opacity.clamp(0.3, 0.8));

      canvas.drawCircle(
        Offset(p.x * size.width, p.y * size.height),
        p.radius,
        paint,
      );

      // Thêm hiệu ứng glow nhẹ cho hạt
      if (p.radius > 2.0) {
        final glowPaint = Paint()
          ..color = Colors.white.withOpacity(opacity * 0.3)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);

        canvas.drawCircle(
          Offset(p.x * size.width, p.y * size.height),
          p.radius * 1.5,
          glowPaint,
        );
      }
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
        colors: [
          const Color(0xFF0D1B2A).withOpacity(0.9),
          const Color(0xFF1B263B).withOpacity(0.8),
          const Color(0xFF2C3E50).withOpacity(0.7),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();
    path.moveTo(0, size.height);

    // Đường núi phức tạp hơn
    path.lineTo(0, size.height * 0.6);
    path.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.5,
      size.width * 0.2,
      size.height * 0.55,
    );
    path.quadraticBezierTo(
      size.width * 0.35,
      size.height * 0.4,
      size.width * 0.5,
      size.height * 0.65,
    );
    path.quadraticBezierTo(
      size.width * 0.65,
      size.height * 0.35,
      size.width * 0.8,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.45,
      size.width,
      size.height * 0.55,
    );

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);

    // Thêm lớp shadow cho chân núi
    final shadowPaint = Paint()
      ..color = const Color(0xFF050A14).withOpacity(0.4)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 15);

    canvas.drawPath(path, shadowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
