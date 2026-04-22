import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';

class OptimizedFirefliesBackground extends StatefulWidget {
  const OptimizedFirefliesBackground({super.key});

  @override
  State<OptimizedFirefliesBackground> createState() =>
      _OptimizedFirefliesBackgroundState();
}

class _OptimizedFirefliesBackgroundState
    extends State<OptimizedFirefliesBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<_Firefly> _fireflies;
  static const int _count = 36;
  final _random = math.Random();

  @override
  void initState() {
    super.initState();
    _fireflies = List.generate(_count, (_) => _createFirefly());

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 25), // TĂNG THỜI GIAN - GIẢM TỐC ĐỘ
    )..repeat();
  }

  _Firefly _createFirefly() {
    return _Firefly(
      x: _random.nextDouble(),
      y: _random.nextDouble(),
      speed: _random.nextDouble() * 0.0004 + 0.0002,
      angle: _random.nextDouble() * math.pi * 2,
      size: _random.nextDouble() * 3.0 + 1.5,
      depth: _random.nextDouble(),
      blinkOffset: _random.nextDouble() * math.pi * 2,
      blinkSpeed: _random.nextDouble() * 0.8 + 0.5, // GIẢM TỐC ĐỘ NHẤP NHÁY
      blinkIntensity: _random.nextDouble() * 0.9 + 0.3,
      pulsePattern: _random.nextInt(3),
      color: _palette[_random.nextInt(_palette.length)],
    );
  }

  static const _palette = [
    Color(0xFF00FFFF),
    Color(0xFFFF00FF),
    Color(0xFFFFFF00),
    Color(0xFF00FF80),
    Color(0xFFFF8000),
    Color(0xFF8080FF),
    Color(0xFFFF6060),
    Color(0xFF60FF60),
    Color(0xFF6060FF),
    Color(0xFFFF60FF),
    Color(0xFFFFFF80),
    Color(0xFF80FFFF),
  ];

  void _update(double time) {
    for (final f in _fireflies) {
      if (_random.nextDouble() < 0.3) {
        f.angle += (_random.nextDouble() - 0.5) * 0.04;
      }

      final speed = f.speed * (0.6 + f.depth * 0.8);
      f.x += math.cos(f.angle) * speed;
      f.y += math.sin(f.angle) * speed;

      if (f.x <= 0 || f.x >= 1) f.angle = math.pi - f.angle;
      if (f.y <= 0 || f.y >= 1) f.angle = -f.angle;

      f.x = f.x.clamp(0, 1);
      f.y = f.y.clamp(0, 1);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          final t = _controller.value;
          _update(t);

          return Stack(
            children: [
              _DynamicBackground(t),
              CustomPaint(
                painter: _FirefliesPainter(fireflies: _fireflies, time: t),
                size: Size.infinite,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Firefly {
  double x, y;
  double speed;
  double angle;
  double size;
  double depth;
  double blinkOffset;
  double blinkSpeed;
  double blinkIntensity;
  int pulsePattern;
  Color color;

  _Firefly({
    required this.x,
    required this.y,
    required this.speed,
    required this.angle,
    required this.size,
    required this.depth,
    required this.blinkOffset,
    required this.blinkSpeed,
    required this.blinkIntensity,
    required this.pulsePattern,
    required this.color,
  });
}

class _FirefliesPainter extends CustomPainter {
  final List<_Firefly> fireflies;
  final double time;

  _FirefliesPainter({required this.fireflies, required this.time});

  double _getPulseValue(_Firefly f, double time) {
    final baseTime = time * f.blinkSpeed + f.blinkOffset;

    switch (f.pulsePattern) {
      case 0: // Pattern chậm và êm dịu
        return (math.sin(baseTime * 2 * math.pi) + 1) * 0.6; // GIẢM TỐC ĐỘ

      case 1: // Pattern chậm với đỉnh mượt
        final value = math.sin(baseTime * 1.5 * math.pi); // GIẢM TỐC ĐỘ
        return value > 0 ? math.pow(value, 1.5).toDouble() : 0;

      case 2: // Pattern ngẫu nhiên chậm
        final randomFactor = math.sin(baseTime * 6) * 0.3; // GIẢM TỐC ĐỘ
        final basePulse =
            (math.sin(baseTime * 2 * math.pi) + 1) * 0.7; // GIẢM TỐC ĐỘ
        return (basePulse + randomFactor).clamp(0.3, 1.0);

      default:
        return (math.sin(baseTime * 2 * math.pi) + 1) * 0.7; // GIẢM TỐC ĐỘ
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (final f in fireflies) {
      final pos = Offset(f.x * size.width, f.y * size.height);
      final pulse = _getPulseValue(f, time);

      final baseOpacity = 0.3 + pulse * f.blinkIntensity * 0.9;
      final dynamicOpacity = baseOpacity * (0.9 + f.depth * 0.5);
      final opacity = dynamicOpacity.clamp(0.4, 1.0);

      final baseRadius = f.size * (1.0 + f.depth * 0.6);
      final pulseRadius = baseRadius * (1.2 + pulse * 0.5);

      final layers = [
        Paint()
          ..color = f.color.withOpacity(opacity * 0.5)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12),

        Paint()
          ..color = f.color.withOpacity(opacity * 0.8)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8),

        Paint()
          ..color = f.color.withOpacity(opacity)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),

        Paint()
          ..color = Colors.white.withOpacity(opacity * 0.7)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2),
      ];

      for (int i = 0; i < layers.length; i++) {
        final layerRadius = pulseRadius * (0.4 + i * 0.2);
        canvas.drawCircle(pos, layerRadius, layers[i]);
      }

      // GIẢM TẦN SUẤT SPARKLE
      if (pulse > 0.7 && math.Random().nextDouble() < 0.3) {
        final sparklePaint = Paint()
          ..color = Colors.white.withOpacity(pulse * 0.8)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);

        canvas.drawCircle(
          pos.translate(
            (math.Random().nextDouble() - 0.5) * 15,
            (math.Random().nextDouble() - 0.5) * 15,
          ),
          pulseRadius * 0.4,
          sparklePaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(_) => true;
}

class _DynamicBackground extends StatelessWidget {
  final double t;

  const _DynamicBackground(this.t);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF0A1020),
            const Color(0xFF152040),
            const Color(0xFF080C18),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
