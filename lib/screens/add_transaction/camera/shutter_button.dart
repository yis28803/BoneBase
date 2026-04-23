import 'package:flutter/material.dart';

class ShutterButton extends StatelessWidget {
  const ShutterButton({
    super.key,
    required this.isCapturing,
    required this.onTap,
  });

  final bool isCapturing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isCapturing ? null : onTap,
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: isCapturing
              ? null
              : const SweepGradient(
                  colors: [
                    Color(0xFF6C63FF),
                    Color(0xFFE040FB),
                    Color(0xFFFF6B9D),
                    Color(0xFF6C63FF),
                  ],
                ),
          color: isCapturing ? Colors.grey.withOpacity(0.5) : null,
          boxShadow: isCapturing
              ? null
              : [
                  BoxShadow(
                    color: const Color(0xFF6C63FF).withOpacity(0.4),
                    blurRadius: 16,
                    spreadRadius: 2,
                  ),
                ],
        ),
        padding: const EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            color: isCapturing ? Colors.grey.withOpacity(0.3) : Colors.white,
            shape: BoxShape.circle,
          ),
          child: isCapturing
              ? const Padding(
                  padding: EdgeInsets.all(18),
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Color(0xFF6C63FF),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}