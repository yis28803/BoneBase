import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../models/transaction.dart' as model;

class CategoryFilterBar extends StatelessWidget {
  final model.Category? selectedCategory;
  final ValueChanged<model.Category?> onCategoryChanged;

  const CategoryFilterBar({
    super.key,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    final cats = [
      (null, '📋', 'Tất cả', const Color(0xFF6C63FF)),
      (
        model.Category.food,
        model.Category.food.icon,
        model.Category.food.label,
        model.Category.food.color,
      ),
      (
        model.Category.transport,
        model.Category.transport.icon,
        model.Category.transport.label,
        model.Category.transport.color,
      ),
      (
        model.Category.shopping,
        model.Category.shopping.icon,
        model.Category.shopping.label,
        model.Category.shopping.color,
      ),
      (
        model.Category.health,
        model.Category.health.icon,
        model.Category.health.label,
        model.Category.health.color,
      ),
      (
        model.Category.entertainment,
        model.Category.entertainment.icon,
        model.Category.entertainment.label,
        model.Category.entertainment.color,
      ),
      (
        model.Category.salary,
        model.Category.salary.icon,
        model.Category.salary.label,
        model.Category.salary.color,
      ),
      (
        model.Category.bonus,
        model.Category.bonus.icon,
        model.Category.bonus.label,
        model.Category.bonus.color,
      ),
      (
        model.Category.investment,
        model.Category.investment.icon,
        model.Category.investment.label,
        model.Category.investment.color,
      ),
      (
        model.Category.other,
        model.Category.other.icon,
        model.Category.other.label,
        model.Category.other.color,
      ),
    ];

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: cats.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final cat = cats[i];
          final isSelected = selectedCategory == cat.$1;
          final categoryColor = cat.$4;

          return GestureDetector(
            onTap: () {
              HapticFeedback.selectionClick();
              onCategoryChanged(cat.$1);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                gradient: isSelected
                    ? LinearGradient(
                        colors: [categoryColor, categoryColor.withOpacity(0.7)],
                      )
                    : null,
                color: isSelected ? null : const Color(0xFF1C1C1E),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected
                      ? Colors.transparent
                      : Colors.white.withOpacity(0.1),
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: categoryColor.withOpacity(0.4),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ]
                    : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(cat.$2, style: const TextStyle(fontSize: 14)),
                  const SizedBox(width: 6),
                  Text(
                    cat.$3,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white60,
                      fontSize: 13,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}