import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../models/transaction.dart' as model;

class HolographicDayCell extends StatelessWidget {
  final DateTime date;
  final List<model.Transaction> transactions;
  final DateTime currentMonth;
  final VoidCallback onTap;
  final double? cellSize; // 🆕 Thêm parameter (optional)

  const HolographicDayCell({
    super.key,
    required this.date,
    required this.transactions,
    required this.currentMonth,
    required this.onTap,
    this.cellSize,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isToday =
        date.year == now.year && date.month == now.month && date.day == now.day;
    final isFuture = date.isAfter(now);
    final isCurrentMonth = date.month == currentMonth.month;
    final txCount = transactions.length;

    // 🎯 TÍNH TOÁN KÍCH THƯỚC RESPONSIVE
    final baseSize = cellSize ?? 50.0; // Default 50 nếu không truyền vào
    final circleSize = baseSize * 0.72; // 42/50 = 0.84
    final emptyCircleSize = baseSize * 0.92; // 46/50 = 0.92
    final thumbSize = baseSize * 0.76; // 38/50 = 0.76
    final dayFontSize = baseSize * 0.22; // 11/50 = 0.22
    final indicatorDotSize = baseSize * 0.08; // 4/50 = 0.08
    final extraBadgeSize = baseSize * 0.36; // 18/50 = 0.36
    final emojiSize = baseSize * 0.34; // 17/50 = 0.34

    return GestureDetector(
      onTap: isFuture ? null : onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: circleSize,
            height: circleSize,
            child: txCount == 0
                ? _buildEmptyCell(isFuture, isCurrentMonth, isToday, emptyCircleSize)
                : _buildTransactionStack(transactions, isToday, thumbSize, extraBadgeSize, emojiSize),
          ),

          SizedBox(height: baseSize * 0.04), // 2/50 = 0.04

          Text(
            '${date.day}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: dayFontSize,
              height: 1,
              fontWeight: isToday ? FontWeight.bold : FontWeight.w500,
              color: isToday
                  ? const Color(0xFF6C63FF)
                  : isFuture
                  ? Colors.white.withOpacity(0.2)
                  : isCurrentMonth
                  ? Colors.white.withOpacity(0.8)
                  : Colors.white.withOpacity(0.4),
            ),
          ),

          if (isToday) ...[
            SizedBox(height: baseSize * 0.04),
            Container(
              width: indicatorDotSize,
              height: indicatorDotSize,
              decoration: BoxDecoration(
                color: const Color(0xFF6C63FF),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF6C63FF).withOpacity(0.6),
                    blurRadius: baseSize * 0.08, // 4/50 = 0.08
                    spreadRadius: baseSize * 0.01, // 0.5/50 = 0.01
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEmptyCell(bool isFuture, bool isCurrentMonth, bool isToday, double circleSize) {
    return Container(
      width: circleSize,
      height: circleSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isToday
              ? const Color(0xFF6C63FF).withOpacity(0.5)
              : isFuture
              ? Colors.white.withOpacity(0.06)
              : Colors.white.withOpacity(0.12),
          width: isToday ? 2 : 1.2,
        ),
        color: isToday
            ? const Color(0xFF6C63FF).withOpacity(0.15)
            : Colors.white.withOpacity(0.02),
        boxShadow: isToday
            ? [
                BoxShadow(
                  color: const Color(0xFF6C63FF).withOpacity(0.4),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ]
            : null,
      ),
      child: isFuture
          ? null
          : Icon(
              Icons.add_rounded,
              size: circleSize * 0.43, // 20/46 = 0.43
              color: isCurrentMonth
                  ? Colors.white.withOpacity(0.3)
                  : Colors.white.withOpacity(0.15),
            ),
    );
  }

  Widget _buildTransactionStack(
    List<model.Transaction> txs,
    bool isToday,
    double thumbSize,
    double extraBadgeSize,
    double emojiSize,
  ) {
    final show = txs.take(3).toList();
    final extra = txs.length - show.length;

    return Stack(
      alignment: Alignment.center,
      children: [
        for (int i = show.length - 1; i >= 0; i--)
          Transform.translate(
            offset: Offset(i * 5.0 - (show.length - 1) * 2.5, 0),
            child: Transform.rotate(
              angle: (i - 1) * 0.1,
              child: _TxThumb(
                transaction: show[i],
                isHighlighted: isToday && i == show.length - 1,
                thumbSize: thumbSize,
                emojiSize: emojiSize,
              ),
            ),
          ),
        if (extra > 0)
          Positioned(
            bottom: -2,
            right: -2,
            child: Container(
              width: extraBadgeSize,
              height: extraBadgeSize,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6C63FF), Color(0xFF00D9FF)],
                ),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF6C63FF).withOpacity(0.5),
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                '+$extra',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: extraBadgeSize * 0.5, // 9/18 = 0.5
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _TxThumb extends StatelessWidget {
  final model.Transaction transaction;
  final bool isHighlighted;
  final double thumbSize; // 🆕 Thêm parameter
  final double emojiSize; // 🆕 Thêm parameter

  const _TxThumb({
    required this.transaction,
    this.isHighlighted = false,
    required this.thumbSize,
    required this.emojiSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: thumbSize,
      height: thumbSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(thumbSize * 0.29), // 11/38 = 0.29
        border: Border.all(
          color: isHighlighted ? const Color(0xFF6C63FF) : Colors.black,
          width: 2,
        ),
        color: const Color(0xFF2C2C2E),
        boxShadow: isHighlighted
            ? [
                BoxShadow(
                  color: const Color(0xFF6C63FF).withOpacity(0.5),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ]
            : null,
      ),
      clipBehavior: Clip.hardEdge,
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    if (transaction.imagePath != null && transaction.imagePath!.isNotEmpty) {
      if (transaction.imagePath!.startsWith('http')) {
        return CachedNetworkImage(
          imageUrl: transaction.imagePath!,
          fit: BoxFit.cover,
          placeholder: (context, url) => Center(
            child: SizedBox(
              width: thumbSize * 0.32, // 12/38 = 0.32
              height: thumbSize * 0.32,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
          errorWidget: (_, __, ___) => _buildCategoryThumb(),
        );
      } else {
        return Image.file(
          File(transaction.imagePath!),
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _buildCategoryThumb(),
        );
      }
    }
    return _buildCategoryThumb();
  }

  Widget _buildCategoryThumb() {
    return Center(
      child: Text(
        _getCategoryEmoji(transaction.category),
        style: TextStyle(fontSize: emojiSize),
      ),
    );
  }

  String _getCategoryEmoji(model.Category cat) {
    switch (cat) {
      case model.Category.food:
        return model.Category.food.icon;
      case model.Category.transport:
        return model.Category.transport.icon;
      case model.Category.shopping:
        return model.Category.shopping.icon;
      case model.Category.health:
        return model.Category.health.icon;
      case model.Category.entertainment:
        return model.Category.entertainment.icon;
      case model.Category.salary:
        return model.Category.salary.icon;
      case model.Category.bonus:
        return model.Category.bonus.icon;
      case model.Category.investment:
        return model.Category.investment.icon;
      default:
        return model.Category.other.icon;
    }
  }
}
