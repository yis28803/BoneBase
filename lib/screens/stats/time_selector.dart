import 'package:flutter/material.dart';

enum TimeSelectorType { month, year }

class TimeSelector extends StatelessWidget {
  final TimeSelectorType type;
  final DateTime? currentMonth;
  final int? currentYear;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;

  const TimeSelector({
    super.key,
    required this.type,
    this.currentMonth,
    this.currentYear,
    this.onPrev,
    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF6C63FF),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left, color: Colors.white, size: 28),
            onPressed: onPrev,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          Text(
            type == TimeSelectorType.month
                ? 'Tháng ${currentMonth!.month}/${currentMonth!.year}'
                : 'Năm ${currentYear!}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right, color: Colors.white, size: 28),
            onPressed: onNext,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
