import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'glassmorphic_container.dart';

class MonthNavigationBar extends StatelessWidget {
  final DateTime currentMonth;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final VoidCallback onPickMonthYear;

  const MonthNavigationBar({
    super.key,
    required this.currentMonth,
    required this.onPrev,
    required this.onNext,
    required this.onPickMonthYear,
  });

  @override
  Widget build(BuildContext context) {
    final label = DateFormat('MMMM yyyy', 'vi').format(currentMonth);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
      child: GlassmorphicContainer(
        borderRadius: 16,
        opacity: 0.05,
        padding: const EdgeInsets.all(3),
        child: Row(
          children: [
            InkWell(
              onTap: onPrev,
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 44,
                height: 44,
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.white.withOpacity(0.7),
                  size: 22,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: onPickMonthYear,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.white.withOpacity(0.5),
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: onNext,
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 44,
                height: 44,
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.white.withOpacity(0.7),
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}