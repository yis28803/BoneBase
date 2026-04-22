import 'package:flutter/material.dart';
import 'dart:math' as math;

class GeometricShapesBackground extends StatefulWidget {
  const GeometricShapesBackground({super.key});

  @override
  State<GeometricShapesBackground> createState() =>
      _GeometricShapesBackgroundState();
}

class _GeometricShapesBackgroundState extends State<GeometricShapesBackground>
    with SingleTickerProviderStateMixin {
  late List<_Shape> _shapes;
  late AnimationController _controller;

  final int _shapeCount = 25; // TĂNG SỐ LƯỢNG HÌNH

  @override
  void initState() {
    super.initState();
    _initShapes();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 25),
    )..repeat();
  }

  void _initShapes() {
    final random = math.Random();

    // THÊM NHIỀU MÀU SẮC HƠN
    final colors = [
      const Color(0xFF00E5FF), // Cyan
      const Color(0xFF7C4DFF), // Purple
      const Color(0xFF00FFB2), // Green
      const Color(0xFFFF4081), // Pink
      const Color(0xFFFFD600), // Yellow
      const Color(0xFFFF6D00), // Orange
      const Color(0xFFEA80FC), // Light Purple
      const Color(0xFF18FFFF), // Light Cyan
      const Color(0xFF76FF03), // Light Green
      const Color(0xFFFF5252), // Red
      const Color(0xFF651FFF), // Deep Purple
      const Color(0xFF00BFA5), // Teal
    ];

    _shapes = List.generate(
      _shapeCount,
      (_) => _Shape(
        x: random.nextDouble(),
        y: random.nextDouble(),
        xSpeed: (random.nextDouble() - 0.5) * 0.0018, // Tăng tốc độ đa dạng
        ySpeed: (random.nextDouble() - 0.5) * 0.0018,
        size: random.nextDouble() * 50 + 25, // Tăng kích thước
        rotation: random.nextDouble() * math.pi * 2,
        rotationSpeed: (random.nextDouble() - 0.5) * 0.025,
        depth: random.nextDouble() * 2.0 + 0.5,
        type: _ShapeType.values[random.nextInt(_ShapeType.values.length)],
        color: colors[random.nextInt(colors.length)],
        opacity: random.nextDouble() * 0.7 + 0.3, // Thêm opacity ngẫu nhiên
      ),
    );
  }

  void _updateShapes() {
    for (var s in _shapes) {
      s.x += s.xSpeed * s.depth;
      s.y += s.ySpeed * s.depth;
      s.rotation += s.rotationSpeed;

      // Wrap-around effect
      if (s.x < -0.3) s.x = 1.3;
      if (s.x > 1.3) s.x = -0.3;
      if (s.y < -0.3) s.y = 1.3;
      if (s.y > 1.3) s.y = -0.3;
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
      builder: (_, __) {
        _updateShapes();

        return CustomPaint(
          painter: _Painter(shapes: _shapes, time: _controller.value),
          size: Size.infinite,
        );
      },
    );
  }
}

// THÊM NHIỀU HÌNH DẠNG HƠN
enum _ShapeType { 
  triangle, square, diamond, hexagon, 
  circle, pentagon, star, crescent, 
  heart, octagon, cross, spiral 
}

class _Shape {
  double x, y, xSpeed, ySpeed, size, rotation, rotationSpeed, depth, opacity;
  _ShapeType type;
  Color color;

  _Shape({
    required this.x,
    required this.y,
    required this.xSpeed,
    required this.ySpeed,
    required this.size,
    required this.rotation,
    required this.rotationSpeed,
    required this.depth,
    required this.type,
    required this.color,
    required this.opacity,
  });
}

class _Painter extends CustomPainter {
  final List<_Shape> shapes;
  final double time;

  _Painter({required this.shapes, required this.time});

  @override
  void paint(Canvas canvas, Size size) {
    /// 🌌 Background với nhiều gradient layer
    final bgGradient = RadialGradient(
      center: Alignment(0, -0.3),
      radius: 1.6,
      colors: [
        const Color(0xFF0A0F2C),
        const Color(0xFF090C1F),
        const Color(0xFF05070F),
        const Color(0xFF020412),
      ],
    );

    final bg = Paint()
      ..shader = bgGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Offset.zero & size, bg);

    /// 🌫️ Multiple glow layers
    final glows = [
      Paint()
        ..shader = RadialGradient(
          center: const Alignment(-0.3, 0.2),
          radius: 1.4,
          colors: [
            const Color(0xFF7C4DFF).withOpacity(0.15),
            const Color(0xFF00E5FF).withOpacity(0.1),
            Colors.transparent,
          ],
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
      
      Paint()
        ..shader = RadialGradient(
          center: const Alignment(0.4, -0.1),
          radius: 1.1,
          colors: [
            const Color(0xFFFF4081).withOpacity(0.12),
            const Color(0xFFFFD600).withOpacity(0.08),
            Colors.transparent,
          ],
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    ];

    for (final glow in glows) {
      canvas.drawRect(Offset.zero & size, glow);
    }

    /// 🔷 Draw shapes
    for (var s in shapes) {
      canvas.save();

      final offset = Offset(s.x * size.width, s.y * size.height);
      final effectiveOpacity = s.opacity * (0.7 + s.depth * 0.3);

      canvas.translate(offset.dx, offset.dy);
      canvas.scale(s.depth);
      canvas.rotate(s.rotation);

      final path = _buildPath(s);

      /// ✨ Fill gradient với opacity động
      final fill = Paint()
        ..shader = LinearGradient(
          colors: [
            s.color.withOpacity(effectiveOpacity * 0.6),
            s.color.withOpacity(effectiveOpacity * 0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(Rect.fromCircle(center: Offset.zero, radius: s.size));

      canvas.drawPath(path, fill);

      /// 🌟 Glow effect
      final glowPaint = Paint()
        ..color = s.color.withOpacity(effectiveOpacity * 0.3)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 25 * s.depth)
        ..blendMode = BlendMode.plus;

      canvas.drawPath(path, glowPaint);

      /// 🔲 Stroke highlight
      final stroke = Paint()
        ..color = Colors.white.withOpacity(effectiveOpacity * 0.25)
        ..strokeWidth = 1.5 * s.depth
        ..style = PaintingStyle.stroke;

      canvas.drawPath(path, stroke);

      canvas.restore();
    }

    /// ⚡ Center light effect
    final centerGlows = [
      Paint()
        ..shader = RadialGradient(
          colors: [
            Colors.white.withOpacity(0.4),
            const Color(0xFF7C4DFF).withOpacity(0.1),
            Colors.transparent,
          ],
        ).createShader(
          Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: 300,
          ),
        ),
      
      Paint()
        ..shader = RadialGradient(
          colors: [
            const Color(0xFF00E5FF).withOpacity(0.3),
            const Color(0xFFFF4081).withOpacity(0.1),
            Colors.transparent,
          ],
        ).createShader(
          Rect.fromCircle(
            center: Offset(size.width / 2 + 50, size.height / 2 - 50),
            radius: 200,
          ),
        ),
    ];

    for (final glow in centerGlows) {
      canvas.drawCircle(Offset(size.width / 2, size.height / 2), 300, glow);
    }
  }

  Path _buildPath(_Shape s) {
    final path = Path();
    final size = s.size;

    switch (s.type) {
      case _ShapeType.triangle:
        path.moveTo(0, -size / 2);
        path.lineTo(size / 2, size / 2);
        path.lineTo(-size / 2, size / 2);
        break;

      case _ShapeType.square:
        path.addRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(center: Offset.zero, width: size, height: size),
            Radius.circular(size * 0.15),
          ),
        );
        break;

      case _ShapeType.diamond:
        path.moveTo(0, -size / 2);
        path.lineTo(size / 2, 0);
        path.lineTo(0, size / 2);
        path.lineTo(-size / 2, 0);
        break;

      case _ShapeType.hexagon:
        for (int i = 0; i < 6; i++) {
          final angle = i * math.pi / 3;
          final x = size / 2 * math.cos(angle);
          final y = size / 2 * math.sin(angle);
          if (i == 0) {
            path.moveTo(x, y);
          } else {
            path.lineTo(x, y);
          }
        }
        break;

      case _ShapeType.circle:
        path.addOval(Rect.fromCircle(center: Offset.zero, radius: size / 2));
        break;

      case _ShapeType.pentagon:
        for (int i = 0; i < 5; i++) {
          final angle = i * 2 * math.pi / 5 - math.pi / 2;
          final x = size / 2 * math.cos(angle);
          final y = size / 2 * math.sin(angle);
          if (i == 0) {
            path.moveTo(x, y);
          } else {
            path.lineTo(x, y);
          }
        }
        break;

      case _ShapeType.star:
        for (int i = 0; i < 10; i++) {
          final angle = i * math.pi / 5;
          final radius = i % 2 == 0 ? size / 2 : size / 4;
          final x = radius * math.cos(angle);
          final y = radius * math.sin(angle);
          if (i == 0) {
            path.moveTo(x, y);
          } else {
            path.lineTo(x, y);
          }
        }
        break;

      case _ShapeType.crescent:
        path.addArc(
          Rect.fromCircle(center: Offset(-size/6, 0), radius: size/2),
          -math.pi/2,
          math.pi,
        );
        path.addArc(
          Rect.fromCircle(center: Offset(size/6, 0), radius: size/3),
          math.pi/2,
          math.pi,
        );
        break;

      case _ShapeType.heart:
        path.moveTo(0, -size/3);
        path.cubicTo(
          size/2, -size/2,
          size, 0,
          0, size/2,
        );
        path.cubicTo(
          -size, 0,
          -size/2, -size/2,
          0, -size/3,
        );
        break;

      case _ShapeType.octagon:
        for (int i = 0; i < 8; i++) {
          final angle = i * math.pi / 4;
          final x = size / 2 * math.cos(angle);
          final y = size / 2 * math.sin(angle);
          if (i == 0) {
            path.moveTo(x, y);
          } else {
            path.lineTo(x, y);
          }
        }
        break;

      case _ShapeType.cross:
        path.addRect(Rect.fromCenter(center: Offset.zero, width: size, height: size/4));
        path.addRect(Rect.fromCenter(center: Offset.zero, width: size/4, height: size));
        break;

      case _ShapeType.spiral:
        final turns = 3;
        final maxRadius = size / 2;
        for (double t = 0; t <= turns; t += 0.05) {
          final radius = maxRadius * (t / turns);
          final angle = 2 * math.pi * t;
          final x = radius * math.cos(angle);
          final y = radius * math.sin(angle);
          if (t == 0) {
            path.moveTo(x, y);
          } else {
            path.lineTo(x, y);
          }
        }
        break;
    }

    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant _Painter oldDelegate) => true;
}
