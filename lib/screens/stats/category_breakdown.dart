import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/transaction.dart' as model;
import 'category_detail_screen.dart';

/// Danh sách chi tiết từng danh mục kèm progress bar.
class CategoryBreakdown extends StatelessWidget {
  CategoryBreakdown({
    super.key,
    required this.expenseMap,
    required this.total,
    required this.categoryColors,
    required this.startDate,
    required this.endDate,
  });

  final Map<model.Category, double> expenseMap;
  final double total;
  final List<Color> categoryColors;
  final DateTime startDate;
  final DateTime endDate;

  final _fmt = NumberFormat.currency(
    locale: 'vi_VN',
    symbol: '₫',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    final sorted = expenseMap.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Chi tiết',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 16),

          ...sorted.asMap().entries.map((e) {
            final idx = e.key;
            final cat = e.value.key;
            final amount = e.value.value;
            final percent = amount / total;
            final color = categoryColors[idx % categoryColors.length];

            return InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CategoryDetailScreen(
                      category: cat,
                      startDate: startDate,
                      endDate: endDate,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(cat.icon, style: const TextStyle(fontSize: 20)),
                        const SizedBox(width: 10),

                        Expanded(
                          child: Text(
                            cat.label,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),

                        Text(
                          _fmt.format(amount),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),

                        const SizedBox(width: 8),

                        SizedBox(
                          width: 38,
                          child: Text(
                            '${(percent * 100).toStringAsFixed(0)}%',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),

                        const SizedBox(width: 6),

                        const Icon(
                          Icons.chevron_right,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: percent,
                        backgroundColor: color.withOpacity(0.12),
                        valueColor: AlwaysStoppedAnimation<Color>(color),
                        minHeight: 6,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
