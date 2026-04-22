import 'dart:ui';
import 'package:flutter/material.dart';

class GlassmorphicContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final Gradient? gradient;
  final EdgeInsets padding;
  final List<BoxShadow>? boxShadow;

  const GlassmorphicContainer({
    super.key,
    required this.child,
    this.blur = 20,
    this.opacity = 0.08,
    this.borderRadius = 24,
    this.borderColor = Colors.white,
    this.borderWidth = 1.5,
    this.gradient,
    this.padding = EdgeInsets.zero,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // tránh size lỗi
          if (constraints.maxHeight <= 0 || constraints.maxWidth <= 0) {
            return const SizedBox.shrink();
          }

          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Container(
              padding: padding,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(opacity),
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  color: borderColor.withOpacity(0.12),
                  width: borderWidth,
                ),
                gradient: gradient,
                boxShadow: boxShadow,
              ),
              child: child,
            ),
          );
        },
      ),
    );
  }
}