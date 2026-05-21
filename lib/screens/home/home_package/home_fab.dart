import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../add_transaction/camera/camera_capture_screen.dart';


class HomeFab extends StatefulWidget {
  const HomeFab({super.key});

  @override
  State<HomeFab> createState() => _HomeFabState();
}

class _HomeFabState extends State<HomeFab> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onFabPressed() {
    HapticFeedback.mediumImpact();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CameraCaptureScreen()),
        );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: _onFabPressed, // Thêm sự kiện onTap ở đây
        onTapDown: (_) => setState(() => _isHovered = true),
        onTapUp: (_) => setState(() => _isHovered = false),
        onTapCancel: () => setState(() => _isHovered = false),
        child: AnimatedScale(
          scale: _isHovered ? 1.1 : 1.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFCC0000).withOpacity(_isHovered ? 0.8 : 0.6),
                  blurRadius: _isHovered ? 25 : 15,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: RotationTransition(
              turns: _controller,
              child: CustomPaint(painter: SharinganPainter()),
            ),
          ),
        ),
      ),
    );
  }
}

class SharinganPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // 1. Vẽ nền đỏ (Eye Red)
    final eyePaint = Paint()
      ..color = const Color(0xFFCC0000)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, eyePaint);

    // 2. Vẽ viền đen bên ngoài
    final borderPaint = Paint()
      ..color = const Color(0xFF111111)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(center, radius, borderPaint);

    // 3. Vẽ vòng tròn mảnh kết nối các Tomoe
    final innerCircleRadius = radius * 0.58;
    final innerLinePaint = Paint()
      ..color = const Color(0xFF111111).withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawCircle(center, innerCircleRadius, innerLinePaint);

    // 4. Vẽ đồng tử trung tâm (Pupil)
    final pupilPaint = Paint()
      ..color = const Color(0xFF111111)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius * 0.18, pupilPaint);

    // 5. Vẽ 3 Tomoe
    for (int i = 0; i < 3; i++) {
      final double angle = (i * 120) * math.pi / 180;
      final double tomoeX = center.dx + innerCircleRadius * math.cos(angle);
      final double tomoeY = center.dy + innerCircleRadius * math.sin(angle);

      _drawTomoe(canvas, Offset(tomoeX, tomoeY), angle);
    }
  }

  void _drawTomoe(Canvas canvas, Offset position, double rotationAngle) {
    final paint = Paint()
      ..color = const Color(0xFF111111)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    canvas.save();
    canvas.translate(position.dx, position.dy);
    canvas.rotate(rotationAngle);

    /// 👉 1. Đầu tomoe (nhỏ lại cho thanh hơn)
    const headRadius = 3.2;
    canvas.drawCircle(Offset.zero, headRadius, paint);

    /// 👉 2. Đuôi tomoe (chuẩn cong + vuốt theo vòng tròn)
    final path = Path();

    path.moveTo(0, -headRadius);

    /// curve 1 - ra ngoài nhưng ít hơn (thon)
    path.quadraticBezierTo(
      6.5, // giảm từ 10 -> 6.5
      -4.5, // giảm độ cong
      6, // điểm xa nhất nhỏ lại
      2,
    );

    /// curve 2 - ôm về đầu (mượt hơn)
    path.quadraticBezierTo(
      1.8,
      2.0,
      headRadius * 0.7, // nhỏ hơn để gọn
      0,
    );

    path.close();

    canvas.drawPath(path, paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}