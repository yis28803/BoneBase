import 'package:flutter/material.dart';
import 'dart:math' as math;

class FloatingLeavesBackground extends StatefulWidget {
  const FloatingLeavesBackground({super.key});

  @override
  State<FloatingLeavesBackground> createState() =>
      _FloatingLeavesBackgroundState();
}

class _FloatingLeavesBackgroundState extends State<FloatingLeavesBackground>
    with TickerProviderStateMixin {
  late List<_Leaf> _leaves;
  late AnimationController _controller;

  final int _leafCount = 50;

  @override
  void initState() {
    super.initState();
    _initLeaves();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 12))
          ..repeat()
          ..addListener(() {
            setState(() {
              _updateLeaves();
            });
          });
  }

  void _initLeaves() {
    final random = math.Random();

    _leaves = List.generate(
      _leafCount,
      (_) => _Leaf(
        x: random.nextDouble(),
        y: random.nextDouble(),
        rotation: random.nextDouble() * math.pi * 2,
        rotationSpeed: (random.nextDouble() - 0.5) * 0.02,
        fallSpeed: random.nextDouble() * 0.003 + 0.0015,
        swayAmplitude: random.nextDouble() * 0.003 + 0.001,
        swayOffset: random.nextDouble() * math.pi * 2,
        randomSeed: random.nextDouble(),
        size: random.nextDouble() * 12 + 8,
        depth: random.nextDouble() * 1 + 0.5, // 👈 parallax
        bend: (random.nextDouble() - 0.5) * 0.4,
        color: [
          const Color(0xFFD4A574),
          const Color(0xFFA67C52),
          const Color(0xFF6B4423),
          const Color(0xFF8B5A2B),
        ][random.nextInt(4)],
      ),
    );
  }

  void _updateLeaves() {
    for (var leaf in _leaves) {
      leaf.y += leaf.fallSpeed * leaf.depth;
      leaf.rotation += leaf.rotationSpeed;

      leaf.x +=
          math.sin(_controller.value * math.pi * 2 + leaf.swayOffset) *
          leaf.swayAmplitude *
          leaf.depth;

      if (leaf.y > 1.1) {
        leaf.y = -0.1;
        leaf.x = leaf.randomSeed;
      }

      if (leaf.x < -0.1) leaf.x = 1.1;
      if (leaf.x > 1.1) leaf.x = -0.1;
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
      painter: FloatingLeavesPainter(leaves: _leaves, time: _controller.value),
      size: Size.infinite,
    );
  }
}

class _Leaf {
  double x, y;
  double rotation, rotationSpeed;
  double fallSpeed;
  double swayAmplitude, swayOffset;
  double randomSeed;
  double size;
  double depth; // 👈 chiều sâu
  Color color;
  double bend;

  _Leaf({
    required this.x,
    required this.y,
    required this.rotation,
    required this.rotationSpeed,
    required this.fallSpeed,
    required this.swayAmplitude,
    required this.swayOffset,
    required this.randomSeed,
    required this.size,
    required this.depth,
    required this.color,
    required this.bend,
  });
}

class FloatingLeavesPainter extends CustomPainter {
  final List<_Leaf> leaves;
  final double time;

  FloatingLeavesPainter({required this.leaves, required this.time});

  @override
  void paint(Canvas canvas, Size size) {
    /// 🌌 1. Background gradient cinematic
    final bgPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF0F2027),
          Color(0xFF203A43),
          Color(0xFF2C5364),
          Color(0xFF1B4332),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    /// 🌟 2. Light glow
    final lightPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(0, -0.6),
        radius: 1.2,
        colors: [Colors.white.withOpacity(0.08), Colors.transparent],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), lightPaint);

    /// 🍂 3. Draw leaves
    for (var leaf in leaves) {
      canvas.save();

      canvas.translate(leaf.x * size.width, leaf.y * size.height);

      canvas.scale(leaf.depth); // 👈 parallax
      canvas.rotate(leaf.rotation);

      /// ✨ Gradient + blur leaf
      final leafPaint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [leaf.color.withOpacity(0.9), leaf.color.withOpacity(0.4)],
        ).createShader(Rect.fromCircle(center: Offset.zero, radius: leaf.size))
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.5);

      final path = Path();

      final w = leaf.size;
      final h = leaf.size * 1.6;

      // 🍃 tip (đầu lá)
      path.moveTo(0, -h / 2);

      path.cubicTo(w * (0.6 + leaf.bend), -h * 0.3, w * 0.5, h * 0.2, 0, h / 2);

      path.cubicTo(
        -w * 0.5,
        h * 0.2,
        -w * (0.7 - leaf.bend),
        -h * 0.25,
        0,
        -h / 2,
      );

      path.close();

      canvas.drawPath(path, leafPaint);

      /// 🍃 Vein
      final veinPaint = Paint()
        ..color = Colors.white.withOpacity(0.2)
        ..strokeWidth = 1;

      final veinPath = Path()
        ..moveTo(0, -h / 2)
        ..quadraticBezierTo(w * 0.1, 0, 0, h / 2);

      canvas.drawPath(veinPath, veinPaint);

      canvas.restore();
    }

    /// 🌫️ 4. Fog overlay
    final fogPaint = Paint()
      ..color = Colors.white.withOpacity(0.03)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 30);

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), fogPaint);
  }

  @override
  bool shouldRepaint(covariant FloatingLeavesPainter oldDelegate) => true;
}
