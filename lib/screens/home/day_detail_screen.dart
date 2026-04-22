import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/transaction.dart' as model;
import 'transaction_detail_screen.dart';

class DayDetailScreen extends StatefulWidget {
  const DayDetailScreen({
    super.key,
    required this.date,
    required this.transactions,
  });

  final DateTime date;
  final List<model.Transaction> transactions;

  @override
  State<DayDetailScreen> createState() => _DayDetailScreenState();
}

class _DayDetailScreenState extends State<DayDetailScreen> {
  late List<model.Transaction> _transactions;

  @override
  void initState() {
    super.initState();
    _transactions = List.from(widget.transactions);
  }

  void _onTransactionUpdated(model.Transaction updated) {
    setState(() {
      final idx = _transactions.indexWhere((t) => t.id == updated.id);
      if (idx != -1) _transactions[idx] = updated;
    });
  }

  void _onTransactionDeleted(String id) {
    setState(() => _transactions.removeWhere((t) => t.id == id));
    if (_transactions.isEmpty && mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final fmt = NumberFormat('#,###', 'vi');
    final totalExpense = _transactions
        .where((t) => t.type == model.TransactionType.expense)
        .fold(0.0, (s, t) => s + t.amount);
    final totalIncome = _transactions
        .where((t) => t.type == model.TransactionType.income)
        .fold(0.0, (s, t) => s + t.amount);

    final dateLabel = DateFormat(
      'EEEE, \'ngày\' d \'thg\' M, yyyy',
      'vi',
    ).format(widget.date);
    final dateLabelFormatted =
        dateLabel[0].toUpperCase() + dateLabel.substring(1);

    return DraggableScrollableSheet(
      initialChildSize: 1.0,
      minChildSize: 0.4,
      maxChildSize: 1.0,
      expand: false,
      builder: (_, controller) => Container(
        decoration: const BoxDecoration(
          color: Color(0xFF111111),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onVerticalDragUpdate: (details) {
              },
              child: Container(
                width: 36,
                height: 4,
                margin: const EdgeInsets.only(top: 12, bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          dateLabelFormatted,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${_transactions.length} giao dịch',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.45),
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  if (totalExpense > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0x22FF5252),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.arrow_upward,
                            size: 14,
                            color: Color(0xFFFF5252),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${fmt.format(totalExpense)}đ',
                            style: const TextStyle(
                              color: Color(0xFFFF5252),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),

                  if (totalExpense > 0 && totalIncome > 0)
                    const SizedBox(width: 12),

                  if (totalIncome > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0x2269F0AE),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.arrow_downward,
                            size: 14,
                            color: Color(0xFF69F0AE),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${fmt.format(totalIncome)}đ',
                            style: const TextStyle(
                              color: Color(0xFF69F0AE),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  const Spacer(),
                ],
              ),
            ),

            const SizedBox(height: 8),
            const Divider(height: 1, color: Colors.white10),
            const SizedBox(height: 8),

            Expanded(
              child: _transactions.isEmpty
                  ? const Center(
                      child: Text(
                        'Không còn giao dịch nào',
                        style: TextStyle(color: Colors.white38),
                      ),
                    )
                  : GridView.builder(
                      controller: controller,
                      padding: const EdgeInsets.fromLTRB(12, 4, 12, 16),
                      physics:
                          const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 6,
                            mainAxisSpacing: 6,
                            childAspectRatio: 1.0,
                          ),
                      itemCount: _transactions.length,
                      itemBuilder: (_, i) => _TransactionCard(
                        transaction: _transactions[i],
                        onTap: () {
                          final tx = _transactions[i];
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) => TransactionDetailSheet(
                              transaction: tx,
                              onUpdated: _onTransactionUpdated,
                              onDeleted: () => _onTransactionDeleted(tx.id),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TransactionCard extends StatelessWidget {
  const _TransactionCard({required this.transaction, this.onTap});

  final model.Transaction transaction;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final fmt = NumberFormat('#,###', 'vi');
    final isExpense = transaction.type == model.TransactionType.expense;
    final amountText =
        '${isExpense ? '-' : '+'}${fmt.format(transaction.amount)}đ';

    return GestureDetector(
      onVerticalDragStart: (_) {},
      onVerticalDragUpdate: (_) {},
      onVerticalDragEnd: (_) {},
      onVerticalDragCancel: () {},
      behavior: HitTestBehavior
          .opaque,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          splashColor: Colors.white.withOpacity(0.2),
          highlightColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Stack(
              fit: StackFit.expand,
              children: [
                transaction.imagePath != null
                    ? Image.file(
                        File(transaction.imagePath!),
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => _solidBg(),
                      )
                    : _solidBg(),

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.75),
                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 6,
                  left: 6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color:
                          transaction.category.color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      transaction.category.label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 4,
                  right: 4,
                  bottom: 6,
                  child: Text(
                    amountText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _solidBg() => Container(
    color: const Color(0xFF2C2C2E),
    alignment: Alignment.center,
    child: Text(
      transaction.category.icon,
      style: const TextStyle(fontSize: 28),
    ),
  );
}
