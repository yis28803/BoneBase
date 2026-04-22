import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import '../../models/transaction.dart' as model;
import '../../providers/transaction_provider.dart';
import 'package:photo_manager/photo_manager.dart';
// import 'dart:ui' as ui;

class TransactionDetailSheet extends StatefulWidget {
  const TransactionDetailSheet({
    super.key,
    required this.transaction,
    this.onUpdated,
    this.onDeleted,
  });

  final model.Transaction transaction;
  final void Function(model.Transaction updated)? onUpdated;
  final VoidCallback? onDeleted;

  @override
  State<TransactionDetailSheet> createState() => _TransactionDetailSheetState();
}

class _TransactionDetailSheetState extends State<TransactionDetailSheet> {
  late model.Transaction _tx;
  final _cardKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _tx = widget.transaction;
  }

  String get _dateLabel =>
      DateFormat("'lúc' HH:mm 'ngày' d 'tháng' M, yyyy", 'vi').format(_tx.date);

  Future<void> _changeImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (picked == null) return;

    final appDir = await getApplicationDocumentsDirectory();
    final fileName =
        'tx_${_tx.id}_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final saved = await File(picked.path).copy('${appDir.path}/$fileName');

    final updated = model.Transaction(
      id: _tx.id,
      amount: _tx.amount,
      type: _tx.type,
      category: _tx.category,
      note: _tx.note,
      date: _tx.date,
      imagePath: saved.path,
      latitude: _tx.latitude,
      longitude: _tx.longitude,
    );

    if (!mounted) return;
    await context.read<TransactionProvider>().updateTransaction(updated);
    setState(() => _tx = updated);
    widget.onUpdated?.call(updated);
  }

  Future<void> _removeImage() async {
    final updated = model.Transaction(
      id: _tx.id,
      amount: _tx.amount,
      type: _tx.type,
      category: _tx.category,
      note: _tx.note,
      date: _tx.date,
      imagePath: null,
      latitude: _tx.latitude,
      longitude: _tx.longitude,
    );

    if (!mounted) return;
    await context.read<TransactionProvider>().updateTransaction(updated);
    setState(() => _tx = updated);
    widget.onUpdated?.call(updated);
  }

  Future<void> _saveToPhotos() async {
    try {
      // Kiểm tra xem giao dịch có ảnh không
      if (_tx.imagePath == null) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Giao dịch không có ảnh để lưu')),
        );
        return;
      }

      // Đọc file ảnh gốc
      final file = File(_tx.imagePath!);
      if (!await file.exists()) {
        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('File ảnh không tồn tại')));
        return;
      }

      // Đọc bytes từ file
      final bytes = await file.readAsBytes();

      // Lưu vào thư viện ảnh bằng photo_manager
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
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Lỗi khi lưu ảnh')));
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Lỗi: $e')));
    }
  }

  Future<void> _deleteTransaction() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1C1C1E),
        title: const Text(
          'Xoá giao dịch',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Bạn có chắc muốn xoá giao dịch này không?',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Huỷ', style: TextStyle(color: Colors.white54)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              'Xoá',
              style: TextStyle(color: Color(0xFFFF5252)),
            ),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    if (!mounted) return;
    await context.read<TransactionProvider>().deleteTransaction(_tx.id);
    if (!mounted) return;
    Navigator.pop(context);
    widget.onDeleted?.call();
  }

  void _showOptionsMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1C1C1E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36,
              height: 4,
              margin: const EdgeInsets.only(top: 12, bottom: 8),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            _OptionTile(
              icon: Icons.edit_rounded,
              label: 'Sửa giao dịch',
              onTap: () {
                Navigator.pop(context);
                _openEditScreen();
              },
            ),
            _OptionTile(
              icon: Icons.photo_library_outlined,
              label: 'Đổi ảnh nền',
              onTap: () {
                Navigator.pop(context);
                _changeImage();
              },
            ),
            if (_tx.imagePath != null)
              _OptionTile(
                icon: Icons.hide_image_outlined,
                label: 'Xoá ảnh nền',
                onTap: () {
                  Navigator.pop(context);
                  _removeImage();
                },
              ),
            _OptionTile(
              icon: Icons.download_rounded,
              label: 'Lưu vào Ảnh',
              onTap: () {
                Navigator.pop(context);
                _saveToPhotos();
              },
            ),
            _OptionTile(
              icon: Icons.delete_outline_rounded,
              label: 'Xoá giao dịch',
              color: const Color(0xFFFF5252),
              onTap: () {
                Navigator.pop(context);
                _deleteTransaction();
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _openEditScreen() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _EditTransactionSheet(
        transaction: _tx,
        onSaved: (updated) async {
          if (!mounted) return;
          await context.read<TransactionProvider>().updateTransaction(updated);
          setState(() => _tx = updated);
          widget.onUpdated?.call(updated);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1.0,
      minChildSize: 0.7,
      maxChildSize: 1.0,
      expand: true,
      builder: (_, sheetController) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFF111111),
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 0,
                child: SingleChildScrollView(
                  controller: sheetController,
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        width: 36,
                        height: 4,
                        margin: const EdgeInsets.only(top: 12, bottom: 8),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 22,
                        ),
                        child: Row(
                          children: [
                            _TopIconButton(
                              icon: Icons.more_horiz_rounded,
                              onTap: _showOptionsMenu,
                            ),
                            const SizedBox(width: 10),
                            _TopIconButton(
                              icon: Icons.photo_library_outlined,
                              onTap: _changeImage,
                            ),
                            const Spacer(),
                            _TopIconButton(
                              icon: Icons.close_rounded,
                              onTap: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1C1C1E),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.white54,
                              size: 14,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _dateLabel,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: RepaintBoundary(
                      key: _cardKey,
                      child: _DetailCard(tx: _tx),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _EditTransactionSheet extends StatefulWidget {
  const _EditTransactionSheet({
    required this.transaction,
    required this.onSaved,
  });

  final model.Transaction transaction;
  final void Function(model.Transaction updated) onSaved;

  @override
  State<_EditTransactionSheet> createState() => _EditTransactionSheetState();
}

class _EditTransactionSheetState extends State<_EditTransactionSheet> {
  late TextEditingController _amountCtrl;
  late TextEditingController _noteCtrl;
  late model.TransactionType _type;
  late model.Category _category;
  late DateTime _date;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final t = widget.transaction;
    _amountCtrl = TextEditingController(text: t.amount.toStringAsFixed(0));
    _noteCtrl = TextEditingController(text: t.note);
    _type = t.type;
    _category = t.category;
    _date = t.date;
  }

  @override
  void dispose() {
    _amountCtrl.dispose();
    _noteCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (ctx, child) => Theme(data: ThemeData.dark(), child: child!),
    );
    if (picked == null) return;

    if (!mounted) return;
    final timePicked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_date),
      builder: (ctx, child) => Theme(data: ThemeData.dark(), child: child!),
    );
    if (timePicked == null) return;

    setState(() {
      _date = DateTime(
        picked.year,
        picked.month,
        picked.day,
        timePicked.hour,
        timePicked.minute,
      );
    });
  }

  Future<void> _save() async {
    final amountText = _amountCtrl.text.replaceAll(RegExp(r'[^0-9.]'), '');
    final amount = double.tryParse(amountText);
    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập số tiền hợp lệ')),
      );
      return;
    }

    setState(() => _saving = true);

    final updated = model.Transaction(
      id: widget.transaction.id,
      amount: amount,
      type: _type,
      category: _category,
      note: _noteCtrl.text.trim(),
      date: _date,
      imagePath: widget.transaction.imagePath,
      latitude: widget.transaction.latitude,
      longitude: widget.transaction.longitude,
    );

    widget.onSaved(updated);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final dateLabel = DateFormat(
      "d 'tháng' M, yyyy  HH:mm",
      'vi',
    ).format(_date);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1C1C1E),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                const Text(
                  'Sửa giao dịch',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                const _Label('Loại'),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _TypeChip(
                      label: 'Chi tiêu',
                      selected: _type == model.TransactionType.expense,
                      selectedColor: const Color(0xFFFF5252),
                      onTap: () =>
                          setState(() => _type = model.TransactionType.expense),
                    ),
                    const SizedBox(width: 10),
                    _TypeChip(
                      label: 'Thu nhập',
                      selected: _type == model.TransactionType.income,
                      selectedColor: const Color(0xFF69F0AE),
                      onTap: () =>
                          setState(() => _type = model.TransactionType.income),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                const _Label('Số tiền (đ)'),
                const SizedBox(height: 8),
                _DarkField(
                  controller: _amountCtrl,
                  hint: 'Nhập số tiền...',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(height: 16),

                const _Label('Danh mục'),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: model.Category.values.map((cat) {
                    final selected = _category == cat;
                    return GestureDetector(
                      onTap: () => setState(() => _category = cat),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: selected ? cat.color : const Color(0xFF2C2C2E),
                          borderRadius: BorderRadius.circular(20),
                          border: selected
                              ? Border.all(color: cat.border, width: 1.5)
                              : null,
                        ),
                        child: Text(
                          '${cat.icon} ${cat.label}',
                          style: TextStyle(
                            color: selected ? Colors.white : Colors.white60,
                            fontSize: 13,
                            fontWeight: selected
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),

                const _Label('Ghi chú'),
                const SizedBox(height: 8),
                _DarkField(
                  controller: _noteCtrl,
                  hint: 'Nhập ghi chú...',
                  maxLines: 2,
                ),
                const SizedBox(height: 16),

                const _Label('Ngày & Giờ'),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: _pickDate,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C2C2E),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.white54,
                          size: 16,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          dateLabel,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.white38,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 28),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _saving ? null : _save,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E7D32),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      disabledBackgroundColor: const Color(
                        0xFF2E7D32,
                      ).withOpacity(0.5),
                    ),
                    child: _saving
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'Lưu thay đổi',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
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
}

class _DetailCard extends StatelessWidget {
  const _DetailCard({required this.tx});
  final model.Transaction tx;

  @override
  Widget build(BuildContext context) {
    final fmt = NumberFormat('#,###', 'vi');
    final isExpense = tx.type == model.TransactionType.expense;

    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          fit: StackFit.expand,
          children: [
            tx.imagePath != null
                ? Image.file(
                    File(tx.imagePath!),
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _solidBg(),
                  )
                : _solidBg(),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(0.55),
                  ],
                  stops: const [0.0, 0.4, 1.0],
                ),
              ),
            ),

            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Center(
                child: _Chip(
                  icon: _categoryIcon(tx.category),
                  label: tx.category.label,
                  color: tx.category.color,
                ),
              ),
            ),

            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  constraints: const BoxConstraints(
                    minWidth: 180,
                    maxWidth: 330,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2C2E).withOpacity(0.85),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: isExpense ? '- ' : '+ ',
                              style: TextStyle(
                                color: isExpense
                                    ? const Color(0xFFFF5252)
                                    : const Color(0xFF69F0AE),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '${fmt.format(tx.amount)}đ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (tx.note.isNotEmpty) ...[
                        const SizedBox(height: 6),
                        Text(
                          tx.note,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _solidBg() => Container(
    color: const Color(0xFF2C2C2E),
    alignment: Alignment.center,
    child: Text(tx.category.icon, style: const TextStyle(fontSize: 72)),
  );

  IconData _categoryIcon(model.Category cat) {
    switch (cat) {
      case model.Category.food:
        return Icons.restaurant_outlined;
      case model.Category.transport:
        return Icons.directions_car_outlined;
      case model.Category.entertainment:
        return Icons.movie_outlined;
      case model.Category.health:
        return Icons.medical_services_outlined;
      case model.Category.shopping:
        return Icons.shopping_bag_outlined;
      case model.Category.salary:
        return Icons.work_outline;
      case model.Category.bonus:
        return Icons.star_outline;
      case model.Category.investment:
        return Icons.trending_up_outlined;
      case model.Category.other:
        return Icons.category_outlined;
    }
  }
}

class _TopIconButton extends StatelessWidget {
  const _TopIconButton({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: Icon(icon, color: Colors.white, size: 18),
    ),
  );
}

class _Chip extends StatelessWidget {
  const _Chip({required this.icon, required this.label, required this.color});
  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 13),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color = Colors.white,
  });
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) => ListTile(
    leading: Icon(icon, color: color),
    title: Text(label, style: TextStyle(color: color, fontSize: 15)),
    onTap: onTap,
  );
}

class _Label extends StatelessWidget {
  const _Label(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: const TextStyle(
      color: Colors.white54,
      fontSize: 12,
      letterSpacing: 0.5,
    ),
  );
}

class _DarkField extends StatelessWidget {
  const _DarkField({
    required this.controller,
    required this.hint,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    keyboardType: keyboardType,
    inputFormatters: inputFormatters,
    maxLines: maxLines,
    style: const TextStyle(color: Colors.white, fontSize: 15),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white38),
      filled: true,
      fillColor: const Color(0xFF2C2C2E),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

class _TypeChip extends StatelessWidget {
  const _TypeChip({
    required this.label,
    required this.selected,
    required this.selectedColor,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final Color selectedColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: selected
            ? selectedColor.withOpacity(0.18)
            : const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(20),
        border: selected ? Border.all(color: selectedColor, width: 1.5) : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? selectedColor : Colors.white54,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          fontSize: 14,
        ),
      ),
    ),
  );
}
