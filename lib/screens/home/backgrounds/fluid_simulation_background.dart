import 'package:flutter/material.dart';
import 'dart:math' as math;

class FluidSimulationBackground extends StatefulWidget {
  const FluidSimulationBackground({super.key});

  @override
  State<FluidSimulationBackground> createState() =>
      _FluidSimulationBackgroundState();
}

class _FluidSimulationBackgroundState extends State<FluidSimulationBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // ✅ Màu đã điều chỉnh - tối hơn, dịu hơn
  final List<Color> fluidColors = const [
    Color(0xFF4A40D4),
    Color(0xFF00B8CC),
    Color(0xFFD45050),
    Color(0xFF00CC8E),
  ];

  // 🫧 Thêm particles cho mỗi layer
  final List<List<_Particle>> _particles = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    // Khởi tạo particles
    for (int i = 0; i < 4; i++) {
      _particles.add(
        List.generate(
          15, // Số particles mỗi layer
          (index) => _Particle(
            x: math.Random().nextDouble(),
            y: math.Random().nextDouble(),
            size: 2 + math.Random().nextDouble() * 4,
            speed: 0.5 + math.Random().nextDouble() * 0.5,
            opacity: 0.3 + math.Random().nextDouble() * 0.4,
          ),
        ),
      );
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
        painter: _FluidPainter(
          time: _controller.value,
          colors: fluidColors,
          particles: _particles,
        ),
        size: Size.infinite,
      ),
    );
  }
}

// 🫧 Particle class cho hiệu ứng nổi
class _Particle {
  final double x;
  final double y;
  final double size;
  final double speed;
  final double opacity;

  _Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.opacity,
  });
}

class _FluidPainter extends CustomPainter {
  final double time;
  final List<Color> colors;
  final List<List<_Particle>> particles;

  _FluidPainter({
    required this.time,
    required this.colors,
    required this.particles,
  });

  @override
  void paint(Canvas canvas, Size size) {
    /// 🌌 Background (deep gradient)
    final bgPaint = Paint()
      ..shader = const RadialGradient(
        center: Alignment(0, -0.4),
        radius: 1.4,
        colors: [Color(0xFF0A0E27), Color(0xFF090C1F), Color(0xFF05070F)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Offset.zero & size, bgPaint);

    /// 🌫️ Subtle glow layer
    final glow = Paint()
      ..shader = RadialGradient(
        center: const Alignment(-0.3, 0.2),
        radius: 1.2,
        colors: [
          const Color(0xFF6C63FF).withOpacity(0.08),
          const Color(0xFF00E5FF).withOpacity(0.05),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Offset.zero & size, glow);

    /// 🌊 Draw fluid layers (REVERSED - vẽ từ sau ra trước)
    for (int i = colors.length - 1; i >= 0; i--) {
      final baseY = size.height * (0.25 + i * 0.18);
      final thickness = 60.0 + i * 20;

      final path = Path();
      final topPath = Path();

      path.moveTo(0, baseY);
      topPath.moveTo(0, baseY);

      // 🌊 Sóng phức tạp hơn - thêm nhiều frequency
      for (double x = 0; x <= size.width; x += 3) {
        final wave1 = math.sin(x / 100 + time * math.pi * 2 + i) * (35 + i * 6);
        final wave2 = math.sin(x / 60 + time * math.pi * 3.5 + i * 0.5) * 25;
        final wave3 = math.sin(x / 35 + time * math.pi * 5 + i * 0.8) * 18;
        final wave4 =
            math.sin(x / 200 + time * math.pi * 1.5) * 10; // Sóng dài mới

        final y = baseY + wave1 + wave2 + wave3 + wave4;

        path.lineTo(x, y);
        topPath.lineTo(x, y - thickness);
      }

      /// close shape (liquid band)
      for (double x = size.width; x >= 0; x -= 3) {
        final wave1 = math.sin(x / 100 + time * math.pi * 2 + i) * (35 + i * 6);
        final wave2 = math.sin(x / 60 + time * math.pi * 3.5 + i * 0.5) * 25;
        final wave3 = math.sin(x / 35 + time * math.pi * 5 + i * 0.8) * 18;
        final wave4 = math.sin(x / 200 + time * math.pi * 1.5) * 10;

        final y = baseY + wave1 + wave2 + wave3 + wave4;

        path.lineTo(x, y - thickness);
      }

      path.close();

      /// 🎨 Gradient fill (liquid feel)
      final gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [colors[i].withOpacity(0.25), colors[i].withOpacity(0.05)],
      );

      final paint = Paint()
        ..shader = gradient.createShader(
          Rect.fromLTWH(0, baseY - thickness, size.width, thickness),
        );

      canvas.drawPath(path, paint);

      /// ✨ Glow overlay
      final glowPaint = Paint()
        ..color = colors[i].withOpacity(0.12)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);

      canvas.drawPath(path, glowPaint);

      /// 🌟 Highlight edge (glass effect)
      final highlight = Paint()
        ..color = Colors.white.withOpacity(0.06)
        ..strokeWidth = 1.0
        ..style = PaintingStyle.stroke;

      canvas.drawPath(topPath, highlight);

      /// 🫧 Draw particles cho layer này
      _drawParticles(canvas, size, i, baseY, thickness);

      /// ✨ Shimmer effect - ánh sáng di chuyển ngang
      _drawShimmer(canvas, size, i, baseY, thickness);
    }

    /// ⚡ Energy light center (nâng cấp với rings)
    _drawEnergyCore(canvas, size);

    /// 🔮 Floating energy orbs (thêm điểm nhấn nổi)
    _drawFloatingOrbs(canvas, size);
  }

  // 🫧 Vẽ particles nổi trong chất lỏng
  void _drawParticles(
    Canvas canvas,
    Size size,
    int layerIndex,
    double baseY,
    double thickness,
  ) {
    final layerParticles = particles[layerIndex];

    for (int i = 0; i < layerParticles.length; i++) {
      final p = layerParticles[i];

      // Tính vị trí particle di chuyển theo time
      final px =
          (p.x * size.width + time * size.width * p.speed * 0.3) % size.width;

      // Particle dao động theo sóng của layer
      final waveOffset =
          math.sin(px / 80 + time * math.pi * 2 + layerIndex) *
          (35 + layerIndex * 6);
      final py =
          baseY -
          thickness / 2 +
          waveOffset +
          math.sin(time * math.pi + i) * 10;

      // Vẽ particle với glow
      final particlePaint = Paint()
        ..color = colors[layerIndex].withOpacity(p.opacity * 0.6)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

      canvas.drawCircle(Offset(px, py), p.size, particlePaint);

      // Core của particle
      final corePaint = Paint()
        ..color = Colors.white.withOpacity(p.opacity * 0.4);

      canvas.drawCircle(Offset(px, py), p.size * 0.4, corePaint);
    }
  }

  // ✨ Vẽ shimmer effect - ánh sáng di chuyển
  void _drawShimmer(
    Canvas canvas,
    Size size,
    int layerIndex,
    double baseY,
    double thickness,
  ) {
    final shimmerX = (time * size.width * 0.5) % (size.width + 200) - 100;

    final shimmerRect = Rect.fromLTWH(
      shimmerX - 50,
      baseY - thickness,
      100,
      thickness,
    );

    final shimmerGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Colors.transparent,
        Colors.white.withOpacity(0.08),
        Colors.white.withOpacity(0.15),
        Colors.white.withOpacity(0.08),
        Colors.transparent,
      ],
      stops: const [0.0, 0.35, 0.5, 0.65, 1.0],
    );

    final shimmerPaint = Paint()
      ..shader = shimmerGradient.createShader(shimmerRect)
      ..blendMode = BlendMode.overlay;

    canvas.drawRect(shimmerRect, shimmerPaint);
  }

  // ⚡ Vẽ energy core trung tâm
  void _drawEnergyCore(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.5, size.height * 0.4);
    final corePulse = 1 + math.sin(time * 2 * math.pi) * 0.05;

    // Outer glow
    final centerGlow = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.white.withOpacity(0.15),
          const Color(0xFF00E5FF).withOpacity(0.12),
          const Color(0xFF0A0E27).withOpacity(0.08),
          Colors.transparent,
        ],
        stops: const [0.0, 0.35, 0.7, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: 80 * corePulse));

    canvas.drawCircle(center, 80 * corePulse, centerGlow);

    // 🔮 Rotating rings quanh core
    for (int i = 0; i < 3; i++) {
      final ringRadius = 90.0 + i * 25.0;

      final ringAngle = time * 2 * math.pi * (0.2 + i * 0.1) + i * 2.0;

      final ringPaint = Paint()
        ..color = colors[i % colors.length].withOpacity(0.15)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: ringRadius),
        ringAngle,
        math.pi * 1.5,
        false,
        ringPaint,
      );
    }
  }

  // 🔮 Vẽ floating energy orbs
  void _drawFloatingOrbs(Canvas canvas, Size size) {
    final orbPositions = [
      Offset(size.width * 0.2, size.height * 0.3),
      Offset(size.width * 0.8, size.height * 0.5),
      Offset(size.width * 0.3, size.height * 0.7),
    ];

    for (int i = 0; i < orbPositions.length; i++) {
      final basePos = orbPositions[i];

      // Orb di chuyển nhẹ
      final offsetX = math.sin(time * 2 * math.pi + i) * 20;
      final offsetY = math.cos(time * 2 * math.pi * 0.8 + i) * 15;
      final pos = Offset(basePos.dx + offsetX, basePos.dy + offsetY);

      final orbPulse = 1 + math.sin(time * 3 * math.pi + i) * 0.2;
      final orbSize = 8 * orbPulse;

      // Glow của orb
      final orbGlow = Paint()
        ..color = colors[i].withOpacity(0.3)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 15);

      canvas.drawCircle(pos, orbSize * 2, orbGlow);

      // Core của orb
      final orbCore = Paint()..color = colors[i].withOpacity(0.6);

      canvas.drawCircle(pos, orbSize, orbCore);

      // Highlight
      final highlight = Paint()..color = Colors.white.withOpacity(0.4);

      canvas.drawCircle(
        Offset(pos.dx - 2, pos.dy - 2),
        orbSize * 0.3,
        highlight,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _FluidPainter oldDelegate) => true;
}
