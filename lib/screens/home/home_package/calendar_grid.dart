import 'package:flutter/material.dart';
import '../../../models/transaction.dart' as model;
import 'glassmorphic_container.dart';
import 'holographic_day_cell.dart';

class CalendarGrid extends StatelessWidget {
  final List<model.Transaction> allTx;
  final DateTime currentMonth;
  final model.Category? selectedCategory;
  final model.TransactionType? selectedType;
  final bool isTypeFilterActive;
  final void Function(DateTime date, List<model.Transaction> txList) onDayTap;

  const CalendarGrid({
    super.key,
    required this.allTx,
    required this.currentMonth,
    required this.selectedCategory,
    required this.selectedType,
    required this.isTypeFilterActive,
    required this.onDayTap,
  });

  @override
  Widget build(BuildContext context) {
    const weekdays = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];

    final firstDay = DateTime(currentMonth.year, currentMonth.month, 1);
    final startOffset = firstDay.weekday - 1;
    final daysInMonth =
        DateTime(currentMonth.year, currentMonth.month + 1, 0).day;
    final totalCells = startOffset + daysInMonth;
    final rows = (totalCells / 7).ceil();

    // 👉 Dùng MediaQuery thay vì LayoutBuilder (ổn định hơn)
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = 12 * 2 + 6 * 2; // padding ngoài + grid padding
    final cellWidth = (screenWidth - horizontalPadding) / 7;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GlassmorphicContainer(
        borderRadius: 24,
        opacity: 0.04,
        child: Column(
          children: [
            // ── Weekday headers ─────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
              child: Row(
                children: weekdays
                    .map(
                      (d) => Expanded(
                        child: Text(
                          d,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),

            Divider(height: 1, color: Colors.white.withOpacity(0.08)),

            // ── Day grid ─────────────────────────
            GridView.builder(
              shrinkWrap: true, // 🔥 cực kỳ quan trọng
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(6),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1 / 1.25,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: rows * 7,
              itemBuilder: (_, index) {
                final dayNum = index - startOffset + 1;

                if (dayNum < 1 || dayNum > daysInMonth) {
                  return const SizedBox.shrink();
                }

                final date = DateTime(
                  currentMonth.year,
                  currentMonth.month,
                  dayNum,
                );

                var dayTx = allTx.where(
                  (t) =>
                      t.date.year == date.year &&
                      t.date.month == date.month &&
                      t.date.day == date.day,
                );

                if (selectedCategory != null) {
                  dayTx = dayTx.where(
                    (t) => t.category == selectedCategory,
                  );
                }

                if (isTypeFilterActive && selectedType != null) {
                  dayTx = dayTx.where((t) => t.type == selectedType);
                }

                final txList = dayTx.toList();

                return HolographicDayCell(
                  date: date,
                  transactions: txList,
                  currentMonth: currentMonth,
                  onTap: () => onDayTap(date, txList),
                  cellSize: cellWidth,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}