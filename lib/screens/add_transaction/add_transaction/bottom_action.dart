import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Nút hành động ở bottom bar (Chụp lại, Share…).
class BottomAction extends StatelessWidget {
  const BottomAction({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.dimmed = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool dimmed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.card,
              shape: BoxShape.circle,
              border: Border.all(
                color: dimmed ? Colors.white12 : Colors.white24,
                width: 1.2,
              ),
            ),
            child: Icon(
              icon,
              color: dimmed ? Colors.white24 : Colors.white60,
              size: 20,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: dimmed ? Colors.white24 : Colors.white54,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}