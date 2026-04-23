import 'package:flutter/material.dart';

class CameraIconButton extends StatelessWidget {
  const CameraIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.isEnabled = true,
  });

  final IconData icon;
  final VoidCallback onTap;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(isEnabled ? 0.35 : 0.15),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isEnabled ? Colors.white : Colors.white.withOpacity(0.5),
          size: 20,
        ),
      ),
    );
  }
}