import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../../../models/transaction.dart' as model;
import '../../../providers/transaction_provider.dart';
import 'camera_capture_screen.dart';

class AppColors {
  static const background = Color(0xFF1C1C1E);
  static const card = Color(0xFF2C2C2E);
}

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({
    super.key,
    this.initialImagePath,
    this.preselectedDate,
    required this.provider,
  });

  final String? initialImagePath;
  final DateTime? preselectedDate;
  final TransactionProvider provider;

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _noteController = TextEditingController(text: '');
  final _amountController = TextEditingController(text: '0');
  final _formKey = GlobalKey<FormState>();

  model.TransactionType _type = model.TransactionType.expense;
  model.Category _selectedCategory = model.Category.food;

  late DateTime _selectedDate;
  String? _imagePath;
  bool _hasText = false;
  bool _isSaving = false;
  bool _didChangeDependenciesCalled = false;
  bool _isFocusChanging = false;

  final _formatter = NumberFormat('#,###', 'vi_VN');
  bool _showCustomNumpad = false;
  final FocusNode _noteFocusNode = FocusNode();

  // GPS
  double? _latitude;
  double? _longitude;
  bool _locationFetched = false;

  bool get _isValid {
    final raw = _amountController.text.replaceAll('.', '');
    return raw.isNotEmpty && raw != '0';
  }

  bool get _isExpense => _type == model.TransactionType.expense;

  // Sử dụng extension thay vì hardcode
  static const _expenseCategories = [
    model.Category.food,
    model.Category.transport,
    model.Category.shopping,
    model.Category.health,
    model.Category.entertainment,
    model.Category.other,
  ];

  static const _incomeCategories = [
    model.Category.salary,
    model.Category.bonus,
    model.Category.investment,
    model.Category.other,
  ];

  List<model.Category> get _categories =>
      _isExpense ? _expenseCategories : _incomeCategories;

  model.Category get currentCategory => _selectedCategory;

  @override
  void initState() {
    super.initState();
    _imagePath = widget.initialImagePath;
    _selectedDate = widget.preselectedDate ?? DateTime.now();
    _amountController.text = '0';

    _noteController.addListener(() {
      if (mounted) {
        setState(() => _hasText = _noteController.text.trim().isNotEmpty);
      }
    });

    _noteFocusNode.addListener(() {
      if (_isFocusChanging || !mounted) return;
      _isFocusChanging = true;

      if (_noteFocusNode.hasFocus) {
        setState(() => _showCustomNumpad = false);
      } else {
        _hideSystemKeyboard();
      }

      Future.delayed(const Duration(milliseconds: 150), () {
        _isFocusChanging = false;
      });
    });

    _fetchLocation();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() => _showCustomNumpad = true);
      }
    });
  }

  void _hideSystemKeyboard() {
    try {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    } catch (_) {}
  }

  Future<void> _fetchLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return;

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) return;
      }
      if (permission == LocationPermission.deniedForever) return;

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );

      if (mounted) {
        setState(() {
          _latitude = position.latitude;
          _longitude = position.longitude;
          _locationFetched = true;
        });
      }
    } catch (_) {}
  }

  @override
  void dispose() {
    _noteController.dispose();
    _amountController.dispose();
    _noteFocusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_didChangeDependenciesCalled) {
      _didChangeDependenciesCalled = true;
      // Không làm gì thêm - đã xử lý trong initState
    }
  }

  void _onAmountChanged(String value) {
    final raw = value.replaceAll('.', '');
    if (raw.isEmpty) {
      _amountController.text = '0';
      return;
    }
    final number = int.parse(raw);
    final newText = _formatter.format(number);
    _amountController.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  // Thêm biến để lưu trữ phép tính
  String _currentOperation = '';
  String _firstNumber = '';

  void _onNumberTap(String value) {
    if (!mounted) return;

    // Rung 1 lần là đủ 
    HapticFeedback.selectionClick();

    // ===== OK: Ẩn numpad =====
    if (value == 'OK') {
      _hideSystemKeyboard();
      _noteFocusNode.unfocus();

      setState(() {
        _showCustomNumpad = false;
      });

      return;
    }

    final currentText = _amountController.text.replaceAll('.', '');

    // ===== CLEAR =====
    if (value == 'C') {
      _amountController.text = '0';
      _currentOperation = '';
      _firstNumber = '';
      return;
    }

    // ===== OPERATOR (+ - × ÷) =====
    if (['+', '-', '×', '÷'].contains(value)) {
      _firstNumber = currentText;
      _currentOperation = value;
      _amountController.text = '0';
      return;
    }

    // ===== EQUAL (=) =====
    if (value == '=') {
      if (_currentOperation.isNotEmpty && _firstNumber.isNotEmpty) {
        final num1 = double.tryParse(_firstNumber) ?? 0;
        final num2 = double.tryParse(currentText) ?? 0;

        double result = 0;

        switch (_currentOperation) {
          case '+':
            result = num1 + num2;
            break;
          case '-':
            result = num1 - num2;
            break;
          case '×':
            result = num1 * num2;
            break;
          case '÷':
            result = num2 != 0 ? num1 / num2 : 0;
            break;
        }

        _onAmountChanged(result.toStringAsFixed(0));

        _currentOperation = '';
        _firstNumber = '';
      }
      return;
    }

    // ===== BACKSPACE =====
    if (value == 'backspace') {
      if (currentText.isNotEmpty && currentText != '0') {
        final newValue = currentText.substring(0, currentText.length - 1);
        _onAmountChanged(newValue.isEmpty ? '0' : newValue);
      }
      return;
    }

    // ===== QUICK ADD 000 =====
    if (value == '000') {
      final newValue = currentText == '0' ? '000' : currentText + '000';
      _onAmountChanged(newValue);
      return;
    }

    // ===== DEFAULT: NUMBER INPUT =====
    final newValue = currentText == '0' ? value : currentText + value;
    _onAmountChanged(newValue);
  }

  void _showCategoryPicker() {
    HapticFeedback.selectionClick();
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Text(
              'Chọn danh mục',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _categories.map((category) {
                final isSelected =
                    category ==
                    _selectedCategory; // Sử dụng trực tiếp _selectedCategory
                final categoryColor = category.color;
                final borderColor = category.border;

                return GestureDetector(
                  onTap: () {
                    setState(
                      () => _selectedCategory = category,
                    ); // Gán trực tiếp
                    Navigator.pop(context);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? categoryColor.withOpacity(0.8)
                          : Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? borderColor
                            : Colors.white.withOpacity(0.12),
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          category.icon,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          category.label,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    HapticFeedback.selectionClick();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      locale: const Locale('vi', 'VN'),
      builder: (context, child) => Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF6C63FF),
            surface: AppColors.background,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = DateTime(
      now.year,
      now.month,
      now.day,
    ).difference(DateTime(date.year, date.month, date.day)).inDays;
    if (diff == 0) return 'Hôm nay';
    if (diff == 1) return 'Hôm qua';
    return DateFormat('dd/MM/yyyy').format(date);
  }

  Future<void> _saveTransaction() async {
    // if (!_formKey.currentState!.validate()) return;
    final rawAmount = _amountController.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (rawAmount.isEmpty || rawAmount == '0') {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(_snackBar('⚠️ Vui lòng nhập số tiền', isError: true));
      return;
    }

    HapticFeedback.mediumImpact();

    if (!_locationFetched) {
      await _fetchLocation();
    }

    final transaction = model.Transaction(
      id: const Uuid().v4(),
      amount: double.parse(rawAmount),
      type: _type,
      category: _selectedCategory,
      note: _noteController.text.trim(),
      date: _selectedDate,
      imagePath: _imagePath,
      latitude: _latitude,
      longitude: _longitude,
    );

    try {
      print('Bắt đầu lưu giao dịch: ${transaction.id}');
      await Provider.of<TransactionProvider>(
        context,
        listen: false,
      ).addTransaction(transaction);
      // print('Đã lưu giao dịch thành công');

      if (!mounted) return;

      // ScaffoldMessenger.of(context).showSnackBar(
      //   _snackBar(
      //     _locationFetched
      //         ? '✅ Đã lưu giao dịch với vị trí!'
      //         : '✅ Đã lưu giao dịch!',
      //   ),
      // );
      Navigator.pop(context);
    } catch (e) {
      print('Lỗi khi lưu giao dịch: $e');
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        _snackBar('❌ Lỗi khi lưu giao dịch: ${e.toString()}', isError: true),
      );
    }
  }

  SnackBar _snackBar(String msg, {bool isError = false}) => SnackBar(
    content: Text(msg),
    backgroundColor: isError
        ? const Color(0xFFE53935)
        : const Color(0xFF2E7D32),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );

  void _retakePhoto() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
            CameraCaptureScreen(preselectedDate: widget.preselectedDate),
      ),
    );
  }

  Widget _buildCustomNumpad() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      bottom: _showCustomNumpad ? 0 : -300, // Tăng chiều cao để chứa thêm hàng
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {}, // Ngăn sự kiện tap lan ra ngoài
        child: Container(
          height: 300, // Tăng chiều cao
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            children: [
              // Nút đóng bàn phím
              GestureDetector(
                onTap: () {
                  setState(() {
                    _showCustomNumpad = false;
                  });
                },
                child: Container(
                  width: 40,
                  height: 6,
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Bàn phím số với 5 hàng
              Expanded(
                child: Column(
                  children: [
                    // Hàng 1: 7, 8, 9, ÷
                    Expanded(
                      child: Row(
                        children: ['7', '8', '9', '÷'].map((key) {
                          return Expanded(child: _buildNumpadButton(key));
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Hàng 2: 4, 5, 6, ×
                    Expanded(
                      child: Row(
                        children: ['4', '5', '6', '×'].map((key) {
                          return Expanded(child: _buildNumpadButton(key));
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Hàng 3: 1, 2, 3, -
                    Expanded(
                      child: Row(
                        children: ['1', '2', '3', '-'].map((key) {
                          return Expanded(child: _buildNumpadButton(key));
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Hàng 4: C, 0, 000, +
                    Expanded(
                      child: Row(
                        children: ['C', '0', '000', '+'].map((key) {
                          return Expanded(child: _buildNumpadButton(key));
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Hàng 5: Nút = (chiếm full width)
                    Expanded(
                      child: Row(
                        children: [
                          // Nút = (chiếm 3/4)
                          Expanded(flex: 3, child: _buildNumpadButton('=')),
                          const SizedBox(width: 8),
                          // Nút OK (chiếm 1/4)
                          Expanded(flex: 1, child: _buildNumpadButton('OK')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Hàm tạo nút bàn phím
  Widget _buildNumpadButton(String key) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: () => _onNumberTap(key),
        child: Container(
          decoration: BoxDecoration(
            color: _getButtonColor(key),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: _getButtonContent(key)),
        ),
      ),
    );
  }

  // Hàm xác định màu nút dựa trên ký tự
  Color _getButtonColor(String key) {
    if (key == 'C') {
      return const Color(0x22FF5252); // Màu đỏ nhạt cho nút xóa
    } else if (key == '=') {
      return const Color(0x224CAF50); // Màu xanh lá cho nút =
    } else if (key == 'OK') {
      return const Color(0x226C63FF); // Màu tím cho nút OK
    } else if (['+', '-', '×', '÷'].contains(key)) {
      return const Color(0x226C63FF); // Màu tím nhạt cho các phép tính
    } else {
      return Colors.white.withOpacity(0.08); // Màu mặc định
    }
  }

  // Hàm xác định nội dung hiển thị trên nút
  Widget _getButtonContent(String key) {
    if (key == 'C') {
      return const Text(
        'C',
        style: TextStyle(
          color: Colors.white70,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (key == '=') {
      return const Text(
        '=',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (key == 'OK') {
      return const Text(
        'OK',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (['+', '-', '×', '÷'].contains(key)) {
      return Text(
        key,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      );
    } else {
      return Text(
        key,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_showCustomNumpad) {
          setState(() {
            _showCustomNumpad = false;
          });
        }
        // Ẩn bàn phím hệ thống và bỏ focus
        _noteFocusNode.unfocus();
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildTopBar(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _buildImageCard(),
                            const SizedBox(height: 20),
                            _buildControls(),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                    _buildBottomBar(),
                  ],
                ),
              ),
              _buildCustomNumpad(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Huỷ',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _locationFetched
                      ? Row(
                          key: const ValueKey('gps_on'),
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.cruelty_free,
                              size: 14,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'L.O.V.E',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          key: const ValueKey('gps_off'),
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 10,
                              height: 10,
                              child: CircularProgressIndicator(
                                strokeWidth: 1.5,
                                color: Colors.white38,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'L.O.V.E',
                              style: TextStyle(
                                color: Colors.white38,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard() {
    const double spacing = 20;
    List<Color> _createSmoothGradient(bool isExpense) {
      final startColor = isExpense
          ? const Color(0xFFE57878)
          : const Color.fromARGB(255, 122, 235, 99);

      final endColor = const Color(0xFF3B3232);

      final List<Color> colors = [];

      for (double i = 0.0; i <= 1.0; i += 0.1) {
        colors.add(Color.lerp(startColor, endColor, i)!);
      }

      return colors;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 30, 16, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: _imagePath != null
                    ? Image.file(
                        File(_imagePath!),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      )
                    : Container(color: AppColors.card),
              ),
            ),
            Positioned(
              left: 15,
              right: 15,
              bottom: 15,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: _createSmoothGradient(_isExpense),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _isExpense ? '−' : '+',
                          style: TextStyle(
                            fontSize: 36, // Tăng từ 28 lên 36
                            fontWeight:
                                FontWeight.w500, // Tăng độ đậm từ w300 lên w700
                            color: _isExpense
                                ? const Color(0xFFFF5252)
                                : const Color(0xFF69F0AE),
                          ),
                        ),
                        SizedBox(width: spacing),
                        Flexible(
                          child: IntrinsicWidth(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showCustomNumpad = true;
                                  // Ẩn bàn phím hệ thống và bỏ focus khỏi text field
                                  _noteFocusNode.unfocus();
                                  SystemChannels.textInput.invokeMethod(
                                    'TextInput.hide',
                                  );
                                });
                              },

                              child: AbsorbPointer(
                                child: TextFormField(
                                  controller: _amountController,
                                  keyboardType: TextInputType.none,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    letterSpacing: 1.5,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: '0',
                                    hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    isDense: true,
                                  ),
                                  readOnly: true,
                                  validator: (value) {
                                    final raw = value?.replaceAll('.', '');
                                    if (raw == null ||
                                        raw.isEmpty ||
                                        raw == '0') {
                                      return '';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: spacing),
                        const Text(
                          'đ',
                          style: TextStyle(
                            fontSize: 20, // Tăng từ 22 lên 28
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Container(
                      height: 32,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.12),
                        ),
                      ),
                      child: Row(
                        children: [
                          if (!_hasText) ...[
                            Icon(
                              Icons.edit_rounded,
                              size: 15,
                              color: Colors.white.withOpacity(0.4),
                            ),
                            const SizedBox(width: 8),
                          ],
                          Expanded(
                            child: TextField(
                              controller: _noteController,
                              focusNode: _noteFocusNode,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Thêm chi tiết',
                                hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.35),
                                  fontSize: 14,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                              // THÊM 2 DÒNG NÀY - để không tự động hiện bàn phím hệ thống
                              showCursor: true,
                              readOnly: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 7),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Center(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: _showCategoryPicker,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _selectedCategory.color.withOpacity(
                      0.2,
                    ), // Sử dụng trực tiếp _selectedCategory
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _selectedCategory
                          .border, // Sử dụng trực tiếp _selectedCategory
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _selectedCategory
                            .icon, // Sử dụng trực tiếp _selectedCategory
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        _selectedCategory
                            .label, // Sử dụng trực tiếp _selectedCategory
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.white54,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Center(child: _buildTypeToggle()),
          const SizedBox(height: 14),
          Center(
            child: GestureDetector(
              onTap: _pickDate,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.calendar_month_rounded,
                      color: Colors.white70,
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      _formatDate(_selectedDate),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.white54,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeToggle() {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _TypeChip(
            label: '',
            icon: Icons.arrow_outward_rounded,
            isSelected: _isExpense,
            selectedColor: const Color.fromARGB(255, 220, 67, 70),
            onTap: () {
              if (!_isExpense) {
                HapticFeedback.selectionClick();
                setState(() {
                  _type = model.TransactionType.expense;
                  _selectedCategory = model.Category.food;
                });
              }
            },
          ),
          _TypeChip(
            label: '',
            icon: Icons.arrow_downward_rounded,
            isSelected: !_isExpense,
            selectedColor: const Color(0xFF2E7D32),
            onTap: () {
              if (_isExpense) {
                HapticFeedback.selectionClick();
                setState(() {
                  _type = model.TransactionType.income;
                  _selectedCategory = model.Category.salary;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 20),
      decoration: const BoxDecoration(color: Colors.black),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _BottomAction(
            icon: Icons.flip_camera_ios_rounded,
            label: 'Chụp lại',
            onTap: _retakePhoto,
          ),

          GestureDetector(
            onTap: !_isValid
                ? null
                : () async {
                    HapticFeedback.mediumImpact();
                    setState(() => _isSaving = true);

                    await _saveTransaction();

                    setState(() => _isSaving = false);
                  },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              width: 68,
              height: 68,
              decoration: BoxDecoration(
                shape: BoxShape.circle,

                // Gradient nâng cấp (có chiều sâu)
                gradient: _isValid
                    ? const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFFF80AB),
                          Color(0xFFE040FB),
                          Color(0xFF7C4DFF),
                        ],
                        stops: [0.0, 0.5, 1.0],
                      )
                    : const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF3A3A3A), Color(0xFF1F1F1F)],
                      ),

                // Màu disable đẹp hơn
                color: _isValid ? null : const Color(0xFF2A2A2A),

                border: Border.all(
                  color: _isValid
                      ? Colors.white.withOpacity(0.15)
                      : Colors.white.withOpacity(0.05),
                  width: 1.2,
                ),

                // Shadow nhiều lớp → nổi hơn
                boxShadow: _isValid
                    ? [
                        BoxShadow(
                          color: const Color(0xFF00C853).withOpacity(0.4),
                          blurRadius: 18,
                          offset: const Offset(0, 6),
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.6),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
              ),
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: _isSaving
                      ? const SizedBox(
                          key: ValueKey('loading'),
                          width: 26,
                          height: 26,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.6,
                            color: Colors.white,
                          ),
                        )
                      : Icon(
                          Icons.pets,
                          key: const ValueKey('icon'),
                          color: _isValid
                              ? Colors.white.withOpacity(0.95)
                              : Colors.white30,
                          size: 32,
                        ),
                ),
              ),
            ),
          ),

          _BottomAction(
            icon: Icons.ios_share_rounded,
            label: 'Share',
            onTap: () {},
            dimmed: true,
          ),
        ],
      ),
    );
  }
}

class _TypeChip extends StatelessWidget {
  const _TypeChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.selectedColor,
    required this.onTap,
  });
  final String label;
  final IconData icon;
  final bool isSelected;
  final Color selectedColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 15,
              color: isSelected ? Colors.white : Colors.white38,
            ),
            const SizedBox(width: 0),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white38,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomAction extends StatelessWidget {
  const _BottomAction({
    required this.icon,
    required this.label,
    required this.onTap,
    this.dimmed = false,
  });
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool dimmed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.card,
              shape: BoxShape.circle,
              border: Border.all(
                color: dimmed ? Colors.white12 : Colors.white24,
                width: 1.2,
              ),
            ),
            child: Icon(
              icon,
              color: dimmed ? Colors.white24 : Colors.white60,
              size: 20,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: dimmed ? Colors.white24 : Colors.white54,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
