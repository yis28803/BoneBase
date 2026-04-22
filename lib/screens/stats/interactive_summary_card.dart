import 'package:flutter/material.dart';
import '../../../models/transaction.dart' as model;

class InteractiveSummaryCard extends StatelessWidget {
  final double income;
  final double expense;
  final model.TransactionType? selectedFilter;
  final Function(model.TransactionType) onTypeTap;

  const InteractiveSummaryCard({
    super.key,
    required this.income,
    required this.expense,
    required this.selectedFilter,
    required this.onTypeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          // ✅ CHI (Có thể bấm)
          Expanded(
            child: _buildTypeItem(
              title: 'Chi tiêu',
              amount: expense,
              icon: Icons.arrow_upward,
              color: const Color(0xFFFF6B6B),
              type: model.TransactionType.expense,
              isActive: selectedFilter == model.TransactionType.expense,
            ),
          ),
          Container(
            width: 1,
            height: 50,
            color: Colors.grey.shade200,
          ),
          // ✅ THU (Có thể bấm)
          Expanded(
            child: _buildTypeItem(
              title: 'Thu nhập',
              amount: income,
              icon: Icons.arrow_downward,
              color: const Color(0xFF4CAF50),
              type: model.TransactionType.income,
              isActive: selectedFilter == model.TransactionType.income,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeItem({
    required String title,
    required double amount,
    required IconData icon,
    required Color color,
    required model.TransactionType type,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => onTypeTap(type),  // ✅ Gọi callback toggle
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: isActive
            ? BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: color, width: 2),
              )
            : null,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: isActive ? color : Colors.grey, size: 18),
                const SizedBox(width: 4),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              _formatCurrency(amount),
              style: TextStyle(
                color: isActive ? color : Colors.grey.shade800,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatCurrency(double amount) {
    return '₫${amount.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    )}';
  }
}
