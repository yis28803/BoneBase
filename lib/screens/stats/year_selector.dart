import 'package:flutter/material.dart';

class YearSelector extends StatelessWidget {
  final int currentYear;
  final int yearOffset;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;

  const YearSelector({
    super.key,
    required this.currentYear,
    required this.yearOffset,
    this.onPrev,
    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF6C63FF),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left, color: Colors.white),
            onPressed: onPrev,
          ),
          Text(
            'Năm $currentYear',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right, color: Colors.white),
            onPressed: onNext,
          ),
        ],
      ),
    );
  }
}
