import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/transaction.dart' as model;
import 'glassmorphic_container.dart';

class SummaryCards extends StatelessWidget {
  final List<model.Transaction> allTx;
  final DateTime currentMonth;
  final model.TransactionType? selectedType;
  final bool isTypeFilterActive;
  final ValueChanged<model.TransactionType> onToggleType;

  const SummaryCards({
    super.key,
    required this.allTx,
    required this.currentMonth,
    required this.selectedType,
    required this.isTypeFilterActive,
    required this.onToggleType,
  });

  @override
  Widget build(BuildContext context) {
    double totalExpense = 0;
    double totalIncome = 0;

    for (final t in allTx) {
      if (t.date.year != currentMonth.year ||
          t.date.month != currentMonth.month) {
        continue;
      }
      if (t.type == model.TransactionType.expense) {
        totalExpense += t.amount;
      } else if (t.type == model.TransactionType.income) {
        totalIncome += t.amount;
      }
    }

    final fmt = NumberFormat('#,###', 'vi');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: _CardItem(
              label: 'Chi tiêu',
              amount: '${fmt.format(totalExpense)}đ',
              icon: Icons.arrow_outward_rounded,
              color: model.Category.food.color,
              isActive:
                  isTypeFilterActive &&
                  selectedType == model.TransactionType.expense,
              onTap: () => onToggleType(model.TransactionType.expense),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _CardItem(
              label: 'Thu nhập',
              amount: '${fmt.format(totalIncome)}đ',
              icon: Icons.arrow_downward_rounded,
              color: model.Category.salary.color,
              isActive:
                  isTypeFilterActive &&
                  selectedType == model.TransactionType.income,
              onTap: () => onToggleType(model.TransactionType.income),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardItem extends StatelessWidget {
  final String label;
  final String amount;
  final IconData icon;
  final Color color;
  final bool isActive;
  final VoidCallback onTap;

  const _CardItem({
    required this.label,
    required this.amount,
    required this.icon,
    required this.color,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassmorphicContainer(
        borderRadius: 20,
        opacity: isActive ? 0.12 : 0.05,
        padding: const EdgeInsets.all(12),
        gradient: isActive
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color.withOpacity(0.3), color.withOpacity(0.1)],
              )
            : null,
        borderColor: isActive ? color : Colors.white,
        borderWidth: isActive ? 1.5 : 1,
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: color.withOpacity(0.4),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ]
            : null,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: isActive ? Colors.white : color,
                size: 18,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  amount,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
