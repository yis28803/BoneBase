import 'package:flutter/material.dart';
import 'dart:math' as math;

class OrbitalRingsBackground extends StatefulWidget {
  const OrbitalRingsBackground({super.key});

  @override
  State<OrbitalRingsBackground> createState() => _OrbitalRingsBackgroundState();
}

class _OrbitalRingsBackgroundState extends State<OrbitalRingsBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  final int ringCount = 5;

  final List<Color> neonColors = const [
    Color(0xFF00E5FF),
    Color(0xFF7C4DFF),
    Color(0xFF00FFB2),
    Color(0xFFFF4081),
    Color(0xFFFFD740),
  ];

  @override
  void initState() {
    super.initState();

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

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => CustomPaint(
        painter: _OrbitalPainter(
          time: _controller.value,
          colors: neonColors,
          ringCount: ringCount,
        ),
        size: Size.infinite,
      ),
    );
  }
}

class _OrbitalPainter extends CustomPainter {
  final double time;
  final List<Color> colors;
  final int ringCount;

  _OrbitalPainter({
    required this.time,
    required this.colors,
    required this.ringCount,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    /// 🌌 1. Background (deep space gradient)
    final bgPaint = Paint()
      ..shader = const RadialGradient(
        center: Alignment(0, -0.3),
        radius: 1.4,
        colors: [Color(0xFF0A0F2C), Color(0xFF090C1F), Color(0xFF05070F)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Offset.zero & size, bgPaint);

    /// 🌫️ 2. Subtle nebula glow
    final nebula = Paint()
      ..shader = RadialGradient(
        center: const Alignment(0.3, 0.2),
        radius: 1.2,
        colors: [
          const Color(0xFF6C63FF).withOpacity(0.12),
          const Color(0xFF00E5FF).withOpacity(0.08),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Offset.zero & size, nebula);

    final baseRadius = math.min(size.width, size.height) * 0.18;

    /// 🪐 3. Draw rings
    for (int i = 0; i < ringCount; i++) {
      final radius = baseRadius + i * 45;
      final color = colors[i % colors.length];

      final pulse = 1 + math.sin(time * 2 * math.pi + i) * 0.05;

      /// ✨ Glow ring
      final glowPaint = Paint()
        ..color = color.withOpacity(0.25)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);

      canvas.drawCircle(center, radius * pulse, glowPaint);

      /// 🎯 Sharp ring
      final ringPaint = Paint()
        ..shader = SweepGradient(
          colors: [color.withOpacity(0.0), color, color.withOpacity(0.0)],
        ).createShader(Rect.fromCircle(center: center, radius: radius))
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5;

      canvas.drawCircle(center, radius, ringPaint);

      /// 🧠 Orbit motion
      final angle = time * 2 * math.pi * (0.3 + i * 0.1) + i;

      final orbit = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );

      /// 🌟 Particle core
      final particle = Paint()
        ..color = color
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

      canvas.drawCircle(orbit, 5 + i.toDouble(), particle);

      /// 🔥 Trail (smooth fading)
      for (int t = 1; t <= 8; t++) {
        final trailAngle = angle - t * 0.15;

        final trailPos = Offset(
          center.dx + radius * math.cos(trailAngle),
          center.dy + radius * math.sin(trailAngle),
        );

        final trailPaint = Paint()
          ..color = color.withOpacity(0.25 - t * 0.03)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

        canvas.drawCircle(trailPos, (5 + i) * (1 - t * 0.1), trailPaint);
      }
    }

    /// 🌟 4. Center energy core (UPDATED)
    final corePulse =
        1 + math.sin(time * 2 * math.pi) * 0.03; // Giảm pulse từ 0.05 → 0.03

    final coreGlow = Paint()
      ..shader =
          RadialGradient(
            center: Alignment.center,
            radius: 1.5,
            colors: [
              // ❌ Cũ: Colors.white.withOpacity(0.9)
              // ✅ Mới: Giảm opacity và thêm màu xanh đậm
              const Color(0xFF00E5FF).withOpacity(0.4), // 90% → 40%
              const Color(0xFF0066FF).withOpacity(0.2), // Thêm lớp trung gian
              const Color(0xFF0A0F2C).withOpacity(0.1), // Hòa vào background
              Colors.transparent,
            ],
            stops: const [0.0, 0.4, 0.7, 1.0], // Kiểm soát phân bố gradient
          ).createShader(
            Rect.fromCircle(center: center, radius: 50 * corePulse),
          ); // 60 → 50

    canvas.drawCircle(center, 50 * corePulse, coreGlow);

    /// ⚡ Inner core
    final core = Paint()
      ..color = const Color(
        0xFF00E5FF,
      ).withOpacity(0.6); // Trắng → Xanh cyan mờ

    canvas.drawCircle(center, 4, core); // 6 → 4 (giảm kích thước)
  }

  @override
  bool shouldRepaint(covariant _OrbitalPainter oldDelegate) => true;
}
