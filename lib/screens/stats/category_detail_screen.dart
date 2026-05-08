import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';

import '../../models/transaction.dart' as model;
import '../../providers/transaction_provider.dart';
import '../home/transaction_detail_screen.dart';

class CategoryDetailScreen extends StatelessWidget {
  const CategoryDetailScreen({
    super.key,
    required this.category,
    required this.startDate,
    required this.endDate,
  });

  final model.Category category;
  final DateTime startDate;
  final DateTime endDate;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TransactionProvider>();

    final transactions = provider.transactions
        .where((t) =>
            t.category == category &&
            !t.date.isBefore(startDate) &&
            !t.date.isAfter(endDate))
        .toList()
      ..sort((a, b) => b.date.compareTo(a.date));

    final total = transactions.fold<double>(0, (sum, t) => sum + t.amount);
    final average =
        transactions.isEmpty ? 0.0 : total / transactions.length;
    final imageTransactions =
        transactions.where((t) => t.imagePath != null).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111111),
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 8),
              Icon(Icons.chevron_left, color: Color(0xFF3B82F6), size: 28),
              Text(
                'Quay lại',
                style: TextStyle(
                  color: Color(0xFF3B82F6),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 110,
        centerTitle: true,
        title: Text(
          category.label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ─── Hero card ────────────────────────────────────────────────
            _HeroCard(
              category: category,
              total: total,
              count: transactions.length,
            ),
            const SizedBox(height: 12),

            // ─── Stats row ────────────────────────────────────────────────
            _StatsRow(
              count: transactions.length,
              average: average,
              imageCount: imageTransactions.length,
            ),
            const SizedBox(height: 12),

            // ─── Photo section ────────────────────────────────────────────
            if (imageTransactions.isNotEmpty)
              _PhotoSection(imageTransactions: imageTransactions),

            // ─── All transactions ─────────────────────────────────────────
            _AllTransactionsSection(transactions: transactions),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Hero Card
// ═══════════════════════════════════════════════════════════════════════════

class _HeroCard extends StatelessWidget {
  const _HeroCard({
    required this.category,
    required this.total,
    required this.count,
  });

  final model.Category category;
  final double total;
  final int count;

  @override
  Widget build(BuildContext context) {
    final fmt = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: '₫',
      decimalDigits: 0,
    );

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // Icon circle
          Container(
            width: 68,
            height: 68,
            decoration: const BoxDecoration(
              color: Color(0xFFE91E8C),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                category.icon,
                style: const TextStyle(fontSize: 32),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            category.label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '$count giao dịch',
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            fmt.format(total),
            style: const TextStyle(
              color: Color(0xFFE91E8C),
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Stats Row – 3 square cards
// ═══════════════════════════════════════════════════════════════════════════

class _StatsRow extends StatelessWidget {
  const _StatsRow({
    required this.count,
    required this.average,
    required this.imageCount,
  });

  final int count;
  final double average;
  final int imageCount;

  @override
  Widget build(BuildContext context) {
    final fmt = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: '₫',
      decimalDigits: 0,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _StatCard(
            icon: Icons.format_list_bulleted,
            iconColor: const Color(0xFF3B82F6),
            value: count.toString(),
            label: 'Tổng',
          ),
          const SizedBox(width: 10),
          _StatCard(
            icon: Icons.bar_chart,
            iconColor: const Color(0xFF34C759),
            value: fmt.format(average),
            label: 'Trung bình',
          ),
          const SizedBox(width: 10),
          _StatCard(
            icon: Icons.camera_alt_outlined,
            iconColor: const Color(0xFFFF9500),
            value: imageCount.toString(),
            label: 'Ảnh',
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: 22),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Photo Section
// ═══════════════════════════════════════════════════════════════════════════

class _PhotoSection extends StatelessWidget {
  const _PhotoSection({required this.imageTransactions});

  final List<model.Transaction> imageTransactions;

  static const int _maxVisible = 4;

  @override
  Widget build(BuildContext context) {
    final fmt = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: '₫',
      decimalDigits: 0,
    );

    final visible = imageTransactions.take(_maxVisible).toList();
    final hasMore = imageTransactions.length > _maxVisible;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            children: [
              const Icon(Icons.photo_library_outlined,
                  color: Color(0xFF3B82F6), size: 20),
              const SizedBox(width: 8),
              const Text(
                'Ảnh',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              if (hasMore)
                GestureDetector(
                  onTap: () => _showAllPhotos(context),
                  child: const Row(
                    children: [
                      Text(
                        'See all',
                        style: TextStyle(
                          color: Color(0xFF3B82F6),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 2),
                      Icon(Icons.chevron_right,
                          color: Color(0xFF3B82F6), size: 18),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 14),
          // Photo grid (horizontal scroll)
          SizedBox(
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: visible.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (_, i) {
                final tx = visible[i];
                return GestureDetector(
                  onTap: () => _showFullImage(context, tx),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(tx.imagePath!),
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        fmt.format(tx.amount),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        tx.note.isEmpty ? tx.category.label : tx.note,
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 11,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAllPhotos(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _AllPhotosSheet(transactions: imageTransactions),
    );
  }

  void _showFullImage(BuildContext context, model.Transaction tx) {
    showDialog(
      context: context,
      builder: (_) => _FullImageDialog(transaction: tx),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// All Photos Sheet (see all popup)
// ═══════════════════════════════════════════════════════════════════════════

class _AllPhotosSheet extends StatelessWidget {
  const _AllPhotosSheet({required this.transactions});

  final List<model.Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    final fmt = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: '₫',
      decimalDigits: 0,
    );

    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (_, controller) => Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1C1C1E),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Tất cả ảnh',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                controller: controller,
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: transactions.length,
                itemBuilder: (_, i) {
                  final tx = transactions[i];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      showDialog(
                        context: context,
                        builder: (_) => _FullImageDialog(transaction: tx),
                      );
                    },
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            File(tx.imagePath!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(10)),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.7),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                            child: Text(
                              fmt.format(tx.amount),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Full Image Dialog
// ═══════════════════════════════════════════════════════════════════════════

class _FullImageDialog extends StatefulWidget {
  const _FullImageDialog({required this.transaction});

  final model.Transaction transaction;

  @override
  State<_FullImageDialog> createState() => _FullImageDialogState();
}

class _FullImageDialogState extends State<_FullImageDialog> {
  model.Transaction get _tx => widget.transaction;

  Future<void> _saveToPhotos() async {
    try {
      if (_tx.imagePath == null) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Giao dịch không có ảnh để lưu')),
        );
        return;
      }
      final file = File(_tx.imagePath!);
      if (!await file.exists()) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('File ảnh không tồn tại')));
        return;
      }
      final bytes = await file.readAsBytes();
      final AssetEntity? asset = await PhotoManager.editor.saveImage(
        bytes,
        filename: 'capmoney_${DateTime.now().millisecondsSinceEpoch}.jpg',
      );
      if (!mounted) return;
      if (asset != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã lưu ảnh vào thư viện')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Lỗi khi lưu ảnh')));
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Lỗi: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.file(
              File(_tx.imagePath!),
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),
          // Close button
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(6),
                child: const Icon(Icons.close, color: Colors.white, size: 20),
              ),
            ),
          ),
          // Save button
          Positioned(
            bottom: 12,
            right: 12,
            child: GestureDetector(
              onTap: _saveToPhotos,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.download, color: Colors.white, size: 18),
                    SizedBox(width: 6),
                    Text('Lưu ảnh',
                        style: TextStyle(color: Colors.white, fontSize: 13)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// All Transactions Section
// ═══════════════════════════════════════════════════════════════════════════

class _AllTransactionsSection extends StatelessWidget {
  const _AllTransactionsSection({required this.transactions});

  final List<model.Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    final fmt = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: '₫',
      decimalDigits: 0,
    );
    final dateFmt = DateFormat("H:mm d 'thg' M, yyyy", "vi");

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Row(
            children: [
              Icon(Icons.receipt_long_outlined,
                  color: Color(0xFF3B82F6), size: 20),
              SizedBox(width: 8),
              Text(
                'Tất cả giao dịch',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (transactions.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Không có giao dịch',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: transactions.length,
              separatorBuilder: (_, __) =>
                  const Divider(color: Colors.white12, height: 1),
              itemBuilder: (_, i) {
                final tx = transactions[i];
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => TransactionDetailSheet(transaction: tx),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        // Category circle icon
                        Container(
                          width: 44,
                          height: 44,
                          decoration: const BoxDecoration(
                            color: Color(0xFFE91E8C),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              tx.category.icon,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Note + date
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    tx.note.isEmpty
                                        ? tx.category.label
                                        : tx.note,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  if (tx.imagePath != null) ...[
                                    const SizedBox(width: 4),
                                    const Icon(Icons.camera_alt,
                                        color: Colors.white38, size: 14),
                                  ],
                                ],
                              ),
                              const SizedBox(height: 3),
                              Text(
                                dateFmt.format(tx.date),
                                style: const TextStyle(
                                  color: Colors.white38,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Amount
                        Text(
                          '-${fmt.format(tx.amount)}',
                          style: const TextStyle(
                            color: Color(0xFFFF453A),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}