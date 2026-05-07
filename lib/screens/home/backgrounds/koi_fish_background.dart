import 'package:flutter/material.dart';
import 'dart:math' as math;

class KoiFishUltraBackground extends StatefulWidget {
  const KoiFishUltraBackground({super.key});

  @override
  State<KoiFishUltraBackground> createState() => _KoiFishUltraBackgroundState();
}

class _KoiFishUltraBackgroundState extends State<KoiFishUltraBackground>
    with TickerProviderStateMixin {
  late List<_KoiFish> _fishes;
  late List<_Particle> _particles;
  late AnimationController _controller;

  final int _fishCount = 15;
  final int _particleCount = 50;

  @override
  void initState() {
    super.initState();
    _initScene();

    _controller =
        AnimationController(duration: const Duration(seconds: 12), vsync: this)
          ..addListener(() {
            setState(() {
              _update();
            });
          })
          ..repeat();
  }

  void _initScene() {
    final random = math.Random();

    final premiumColors = [
      // 🔥 Neon / Modern 2026
      const Color(0xFFFF7A00), // orange glow
      const Color(0xFFFF3D81), // neon pink
      const Color(0xFF7B61FF), // electric purple
      const Color(0xFF00D4FF), // cyan
      const Color(0xFF00FFA3), // aqua neon
      const Color(0xFFFFC300), // amber
      const Color(0xFF5BFF6A), // fresh green
      // 🐟 Koi truyền thống (rất quan trọng để giữ realism)
      const Color(0xFFFFFFFF), // white (Kohaku base)
      const Color(0xFFDC2626), // koi red
      const Color(0xFF111827), // deep black (Sanke/Showa)
      const Color(0xFFF59E0B), // golden koi
      const Color(0xFFFB923C), // soft orange koi
      // 🌊 Deep water / cinematic accents
      const Color(0xFF1E3A8A), // deep blue
      const Color(0xFF0EA5E9), // water blue
    ];

    _fishes = List.generate(
      _fishCount,
      (_) => _KoiFish(
        x: random.nextDouble(),
        y: random.nextDouble(),
        angle: random.nextDouble() * math.pi * 2,
        speed: random.nextDouble() * 0.0015 + 0.0007,
        size: random.nextDouble() * 30 + 50,
        color: premiumColors[random.nextInt(premiumColors.length)],
        tailPhase: random.nextDouble() * math.pi * 2,
      ),
    );

    _particles = List.generate(
      _particleCount,
      (_) => _Particle(
        x: random.nextDouble(),
        y: random.nextDouble(),
        speed: random.nextDouble() * 0.001 + 0.0002,
        size: random.nextDouble() * 3 + 1,
      ),
    );
  }

  void _update() {
    for (var fish in _fishes) {
      fish.x += math.cos(fish.angle) * fish.speed;
      fish.y += math.sin(fish.angle) * fish.speed;

      if (fish.x < -0.3) fish.x = 1.3;
      if (fish.x > 1.3) fish.x = -0.3;
      if (fish.y < -0.3) fish.y = 1.3;
      if (fish.y > 1.3) fish.y = -0.3;

      fish.angle += (math.Random().nextDouble() - 0.5) * 0.008;
    }

    for (var p in _particles) {
      p.y -= p.speed;
      if (p.y < 0) {
        p.y = 1;
        p.x = math.Random().nextDouble();
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
    return CustomPaint(
      painter: _UltraPainter(
        fishes: _fishes,
        particles: _particles,
        time: _controller.value,
      ),
      size: Size.infinite,
    );
  }
}

class _KoiFish {
  double x, y, angle, speed, size, tailPhase;
  Color color;

  _KoiFish({
    required this.x,
    required this.y,
    required this.angle,
    required this.speed,
    required this.size,
    required this.color,
    required this.tailPhase,
  });
}

class _Particle {
  double x, y, speed, size;

  _Particle({
    required this.x,
    required this.y,
    required this.speed,
    required this.size,
  });
}

class _UltraPainter extends CustomPainter {
  final List<_KoiFish> fishes;
  final List<_Particle> particles;
  final double time;

  _UltraPainter({
    required this.fishes,
    required this.particles,
    required this.time,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFF020617),
          const Color(0xFF0A2540),
          const Color(0xFF001F3F),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Offset.zero & size, bg);

    final causticPaint = Paint()..color = Colors.white.withOpacity(0.03);

    for (int i = 0; i < 8; i++) {
      final dx = math.sin(time * 2 + i) * 40;
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(size.width * (i / 8) + dx, size.height * 0.3),
          width: 120,
          height: 40,
        ),
        causticPaint,
      );
    }

    for (var p in particles) {
      final paint = Paint()..color = Colors.white.withOpacity(0.15);
      canvas.drawCircle(
        Offset(p.x * size.width, p.y * size.height),
        p.size,
        paint,
      );
    }

    for (var fish in fishes) {
      canvas.save();
      canvas.translate(fish.x * size.width, fish.y * size.height);
      canvas.rotate(fish.angle);

      final tailWag = math.sin(time * 6 + fish.tailPhase) * 0.4;

      // Tail
      final tailPaint = Paint()..color = fish.color.withOpacity(0.9);

      final tail = Path();
      tail.moveTo(-fish.size / 3, 0);
      tail.quadraticBezierTo(
        -fish.size / 2,
        -fish.size / 4 + tailWag * fish.size / 3,
        -fish.size * 0.8,
        0,
      );
      tail.quadraticBezierTo(
        -fish.size / 2,
        fish.size / 4 + tailWag * fish.size / 3,
        -fish.size / 3,
        0,
      );
      tail.close();
      canvas.drawPath(tail, tailPaint);

      // Body
      final bodyPaint = Paint()
        ..shader = RadialGradient(
          colors: [fish.color, Colors.white.withOpacity(0.2)],
        ).createShader(Rect.fromCircle(center: Offset.zero, radius: fish.size));

      final body = Path();
      body.moveTo(fish.size / 2, 0);
      body.quadraticBezierTo(fish.size / 4, -fish.size / 2, -fish.size / 3, 0);
      body.quadraticBezierTo(fish.size / 4, fish.size / 2, fish.size / 2, 0);
      body.close();
      canvas.drawPath(body, bodyPaint);

      // Eye
      final eyePaint = Paint()..color = Colors.black;
      canvas.drawCircle(
        Offset(fish.size / 3, -fish.size / 10),
        fish.size / 12,
        eyePaint,
      );

      final eyeHighlight = Paint()..color = Colors.white;
      canvas.drawCircle(
        Offset(fish.size / 3 + fish.size / 30, -fish.size / 12),
        fish.size / 25,
        eyeHighlight,
      );

      // Mouth
      final mouthPaint = Paint()
        ..color = Colors.black.withOpacity(0.6)
        ..strokeWidth = 1.5
        ..style = PaintingStyle.stroke;

      canvas.drawArc(
        Rect.fromCenter(
          center: Offset(fish.size / 2.2, 0),
          width: fish.size / 4,
          height: fish.size / 6,
        ),
        math.pi * 0.2,
        math.pi * 0.6,
        false,
        mouthPaint,
      );

      // Decorative spots (koi pattern)
      final spotPaint = Paint()..color = Colors.white.withOpacity(0.6);

      for (int i = 0; i < 3; i++) {
        final dx = (math.Random().nextDouble() - 0.5) * fish.size / 2;
        final dy = (math.Random().nextDouble() - 0.5) * fish.size / 3;
        canvas.drawCircle(Offset(dx, dy), fish.size / 10, spotPaint);
      }

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
