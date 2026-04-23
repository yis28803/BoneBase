import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../models/transaction.dart' as model;

/// Model rõ ràng thay vì dùng tuple ($1, $2, ...)
class CategoryItem {
  final model.Category? category;
  final String icon;
  final String label;
  final Color color;

  const CategoryItem({
    required this.category,
    required this.icon,
    required this.label,
    required this.color,
  });
}

class CategoryFilterBar extends StatelessWidget {
  final model.Category? selectedCategory;
  final ValueChanged<model.Category?> onCategoryChanged;

  const CategoryFilterBar({
    super.key,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  /// ✅ Tạo 1 lần duy nhất (không bị recreate mỗi build)
  static final List<CategoryItem> _cats = [
    const CategoryItem(
      category: null,
      icon: '📋',
      label: 'Tất cả',
      color: Color(0xFF6C63FF),
    ),
    CategoryItem(
      category: model.Category.food,
      icon: model.Category.food.icon,
      label: model.Category.food.label,
      color: model.Category.food.color,
    ),
    CategoryItem(
      category: model.Category.transport,
      icon: model.Category.transport.icon,
      label: model.Category.transport.label,
      color: model.Category.transport.color,
    ),
    CategoryItem(
      category: model.Category.shopping,
      icon: model.Category.shopping.icon,
      label: model.Category.shopping.label,
      color: model.Category.shopping.color,
    ),
    CategoryItem(
      category: model.Category.health,
      icon: model.Category.health.icon,
      label: model.Category.health.label,
      color: model.Category.health.color,
    ),
    CategoryItem(
      category: model.Category.entertainment,
      icon: model.Category.entertainment.icon,
      label: model.Category.entertainment.label,
      color: model.Category.entertainment.color,
    ),
    CategoryItem(
      category: model.Category.salary,
      icon: model.Category.salary.icon,
      label: model.Category.salary.label,
      color: model.Category.salary.color,
    ),
    CategoryItem(
      category: model.Category.bonus,
      icon: model.Category.bonus.icon,
      label: model.Category.bonus.label,
      color: model.Category.bonus.color,
    ),
    CategoryItem(
      category: model.Category.investment,
      icon: model.Category.investment.icon,
      label: model.Category.investment.label,
      color: model.Category.investment.color,
    ),
    CategoryItem(
      category: model.Category.other,
      icon: model.Category.other.icon,
      label: model.Category.other.label,
      color: model.Category.other.color,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _cats.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final cat = _cats[i];
          final isSelected = selectedCategory == cat.category;
          final categoryColor = cat.color;

          return GestureDetector(
            onTap: () {
              HapticFeedback.selectionClick();
              onCategoryChanged(cat.category);
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
                  Text(cat.icon, style: const TextStyle(fontSize: 14)),
                  const SizedBox(width: 6),
                  Text(
                    cat.label,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white60,
                      fontSize: 13,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w500,
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
