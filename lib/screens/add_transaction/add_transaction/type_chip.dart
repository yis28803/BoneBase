import 'package:flutter/material.dart';

/// Chip chọn loại giao dịch (Chi tiêu / Thu nhập).
class TypeChip extends StatelessWidget {
  const TypeChip({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.selectedColor,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final Color selectedColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 15,
              color: isSelected ? Colors.white : Colors.white38,
            ),
            if (label.isNotEmpty) ...[
              const SizedBox(width: 4),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.white38,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}