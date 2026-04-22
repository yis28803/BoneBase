import 'package:flutter/material.dart';
import 'dart:math' as math;

class PeacockBackground extends StatefulWidget {
  const PeacockBackground({super.key});

  @override
  State<PeacockBackground> createState() => _PeacockBackgroundState();
}

class _PeacockBackgroundState extends State<PeacockBackground>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  Offset _pointer = Offset.zero;

  final _peacock = _Peacock(x: 0.5, y: 0.65);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPan(Offset pos, Size size) {
    setState(() {
      _pointer = Offset(
        (pos.dx / size.width - 0.5) * 2,
        (pos.dy / size.height - 0.5) * 2,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final size = constraints.biggest;

        return GestureDetector(
          onPanUpdate: (e) => _onPan(e.localPosition, size),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_, __) {
              return CustomPaint(
                size: Size.infinite,
                painter: _PeacockPainter(
                  peacock: _peacock,
                  time: _controller.value,
                  pointer: _pointer,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _Peacock {
  double x, y;
  _Peacock({required this.x, required this.y});
}

class _PeacockPainter extends CustomPainter {
  final _Peacock peacock;
  final double time;
  final Offset pointer;

  _PeacockPainter({
    required this.peacock,
    required this.time,
    required this.pointer,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _drawBackground(canvas, size);

    canvas.save();

    // Parallax nhẹ
    final px = pointer.dx * 20;
    final py = pointer.dy * 20;

    canvas.translate(peacock.x * size.width + px, peacock.y * size.height + py);

    _drawParticles(canvas);
    _drawTail(canvas);
    _drawBody(canvas);

    canvas.restore();
  }

  void _drawBackground(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF0B132B), Color(0xFF1C2541), Color(0xFF3A506B)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Offset.zero & size, paint);
  }

  // 🔥 Particle bay nhẹ
  void _drawParticles(Canvas canvas) {
    final rand = math.Random(1);

    for (int i = 0; i < 25; i++) {
      final x = (rand.nextDouble() - 0.5) * 300;
      final y =
          (rand.nextDouble() - 0.5) * 300 +
          math.sin(time * 2 * math.pi + i) * 10;

      final r = rand.nextDouble() * 2 + 1;

      final paint = Paint()..color = Colors.white.withOpacity(0.05);

      canvas.drawCircle(Offset(x, y), r, paint);
    }
  }

  // 🔥 Tail xịn
  void _drawTail(Canvas canvas) {
    const featherCount = 40;

    final spread = math.pi * 1.5;
    final start = math.pi / 2 + spread / 2;

    for (int i = 0; i < featherCount; i++) {
      final t = i / featherCount;

      final angle = start - (spread * t);

      final len = 140 + math.sin(time * 2 * math.pi + i * 0.3) * 12;

      canvas.save();
      canvas.rotate(angle);

      // 🌈 màu
      final color = Color.lerp(
        const Color(0xFF00F5D4),
        const Color(0xFF00BBF9),
        t,
      )!;

      final paint = Paint()
        ..color = color.withOpacity(0.4 + 0.6 * (1 - t))
        ..strokeWidth = 2 + 3 * (1 - t)
        ..strokeCap = StrokeCap.round;

      // glow
      final glow = Paint()
        ..color = color.withOpacity(0.15)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

      final path = Path();
      path.moveTo(0, 0);
      path.quadraticBezierTo(math.sin(i) * 12, -len * 0.5, 0, -len);

      canvas.drawPath(path, glow);
      canvas.drawPath(path, paint);

      // 👁 eye
      final eyeY = -len * 0.75;
      final eye = Offset(0, eyeY);

      final eyeGlow = Paint()
        ..color = color.withOpacity(0.3)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

      canvas.drawCircle(eye, 10, eyeGlow);

      canvas.drawCircle(eye, 7, Paint()..color = const Color(0xFF00F5D4));

      canvas.drawCircle(eye, 4, Paint()..color = const Color(0xFF005F73));

      canvas.drawCircle(eye, 2, Paint()..color = Colors.black);

      canvas.restore();
    }
  }

  void _drawBody(Canvas canvas) {
    final bodyPaint = Paint()..color = const Color(0xFF00A896);

    final body = Path();
    body.moveTo(-18, 0);
    body.quadraticBezierTo(-12, -25, 0, -35);
    body.quadraticBezierTo(12, -25, 18, 0);
    body.quadraticBezierTo(12, 25, 0, 30);
    body.quadraticBezierTo(-12, 25, -18, 0);
    body.close();

    canvas.drawShadow(body, Colors.black, 6, true);
    canvas.drawPath(body, bodyPaint);

    // head
    canvas.drawCircle(const Offset(0, -55), 10, bodyPaint);

    canvas.drawCircle(const Offset(4, -55), 2, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
