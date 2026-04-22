import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/transaction.dart' as model;

/// Biểu đồ tròn thể hiện chi tiêu theo danh mục.
class PieChartCard extends StatefulWidget {
  const PieChartCard({
    super.key,
    required this.expenseMap,
    required this.total,
    required this.categoryColors,
  });

  final Map<model.Category, double> expenseMap;
  final double total;
  final List<Color> categoryColors;

  @override
  State<PieChartCard> createState() => _PieChartCardState();
}

class _PieChartCardState extends State<PieChartCard> {
  int? _touchedIndex;

  final _fmt = NumberFormat.currency(
      locale: 'vi_VN', symbol: '₫', decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    final entries = widget.expenseMap.entries.toList();

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
        children: [
          const Text(
            'Chi tiêu theo danh mục',
            style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 220,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    sections: entries.asMap().entries.map((e) {
                      final idx = e.key;
                      final cat = e.value.key;
                      final amount = e.value.value;
                      final isTouched = _touchedIndex == idx;
                      return PieChartSectionData(
                        value: amount,
                        color: widget.categoryColors[
                            idx % widget.categoryColors.length],
                        radius: isTouched ? 75 : 65,
                        title: (amount / widget.total * 100) >= 5
                            ? '${(amount / widget.total * 100).toStringAsFixed(0)}%'
                            : '',
                        titleStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        badgeWidget: isTouched
                            ? Text(cat.icon,
                                style:
                                    const TextStyle(fontSize: 20))
                            : null,
                        badgePositionPercentageOffset: 1.3,
                      );
                    }).toList(),
                    sectionsSpace: 3,
                    centerSpaceRadius: 50,
                    pieTouchData: PieTouchData(
                      touchCallback: (event, response) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              response?.touchedSection == null) {
                            _touchedIndex = null;
                          } else {
                            _touchedIndex = response!
                                .touchedSection!.touchedSectionIndex;
                          }
                        });
                      },
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Tổng chi',
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade500)),
                    const SizedBox(height: 2),
                    Text(
                      _fmt.format(widget.total),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}