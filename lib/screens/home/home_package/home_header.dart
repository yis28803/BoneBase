import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../models/transaction.dart' as model;
import '../../../providers/transaction_provider.dart';
import 'header_menu_button.dart';

class HomeHeader extends StatefulWidget {
  final List<model.Transaction> allTx;

  const HomeHeader({super.key, required this.allTx});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _editName(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context, listen: false);
    _nameController.text = provider.userName;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1C1C1E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Nhập tên của bạn',
          style: TextStyle(color: Colors.white),
        ),
        content: TextField(
          controller: _nameController,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Ví dụ: Nghĩa',
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
            filled: true,
            fillColor: Colors.white.withOpacity(0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy', style: TextStyle(color: Colors.white54)),
          ),
          TextButton(
            onPressed: () {
              final newName = _nameController.text.trim().isEmpty
                  ? provider.userName
                  : _nameController.text.trim();
              provider.updateUserName(newName);
              Navigator.pop(context);
            },
            child: const Text(
              'Lưu',
              style: TextStyle(color: Color(0xFF6C63FF)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionProvider>(
      builder: (context, provider, _) {
        final now = DateTime.now();
        final todayTx = widget.allTx
            .where(
              (t) =>
                  t.date.year == now.year &&
                  t.date.month == now.month &&
                  t.date.day == now.day,
            )
            .toList();

        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${provider.greeting} ${provider.greetingEmoji}',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: () => _editName(context),
                      child: Text(
                        provider.userName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: todayTx.isEmpty
                            ? const Color(0xFF1A3A1A)
                            : const Color(0xFF3A1A1A),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: todayTx.isEmpty
                              ? const Color(0xFF69F0AE).withOpacity(0.3)
                              : const Color(0xFFFF7043).withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            todayTx.isEmpty
                                ? Icons.check_circle_outline
                                : Icons.receipt_long_rounded,
                            size: 10,
                            color: todayTx.isEmpty
                                ? const Color(0xFF69F0AE)
                                : const Color(0xFFFF7043),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            todayTx.isEmpty
                                ? 'Hôm nay chưa chi tiêu'
                                : 'Hôm nay có ${todayTx.length} giao dịch',
                            style: TextStyle(
                              color: todayTx.isEmpty
                                  ? const Color(0xFF69F0AE)
                                  : const Color(0xFFFF7043),
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const HeaderMenuButton(),
            ],
          ),
        );
      },
    );
  }
}
