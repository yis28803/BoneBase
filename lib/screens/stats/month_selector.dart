import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Thanh chọn tháng hiển thị ở đầu StatsScreen.
class MonthSelector extends StatelessWidget {
  const MonthSelector({
    super.key,
    required this.currentMonth,
    required this.monthOffset,
    required this.onPrev,
    required this.onNext,
  });

  final DateTime currentMonth;
  final int monthOffset;
  final VoidCallback onPrev;
  final VoidCallback? onNext; // null = disable nút tháng sau

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF6C63FF),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: onPrev,
              icon: const Icon(Icons.chevron_left,
                  color: Colors.white, size: 28),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            Text(
              DateFormat('MMMM yyyy', 'vi').format(currentMonth),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            IconButton(
              onPressed: onNext,
              icon: Icon(
                Icons.chevron_right,
                color: onNext == null ? Colors.white30 : Colors.white,
                size: 28,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }
}