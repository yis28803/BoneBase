import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../models/transaction.dart' as model;
import '../../../providers/transaction_provider.dart';
import '../../../controller/home_controller.dart';
import '../../../providers/pokemon_provider.dart';
import '../camera/camera_capture_screen.dart';
import 'app_colors.dart';
import 'bottom_action.dart';
import 'calculator_mixin.dart';
import 'custom_numpad.dart';
import 'type_chip.dart';

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

class _AddTransactionScreenState extends State<AddTransactionScreen>
    with CalculatorMixin {
  final _noteController = TextEditingController();
  final _amountController = TextEditingController(text: '0');
  final _formKey = GlobalKey<FormState>();
  final _noteFocusNode = FocusNode();

  model.TransactionType _type = model.TransactionType.expense;
  model.Category _selectedCategory = model.Category.food;

  late DateTime _selectedDate;
  String? _imagePath;
  bool _hasText = false;
  bool _isSaving = false;
  bool _isFocusChanging = false;
  bool _showCustomNumpad = false;

  // Pokemon
  final _pokemonController = HomeController();

  // GPS
  double? _latitude;
  double? _longitude;
  bool _locationFetched = false;

  // ── Category lists ────────────────────────────────────────────────────────

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

  bool get _isExpense => _type == model.TransactionType.expense;

  List<model.Category> get _categories =>
      _isExpense ? _expenseCategories : _incomeCategories;

  bool get _isValid {
    final raw = _amountController.text.replaceAll('.', '');
    return raw.isNotEmpty && raw != '0';
  }

  // ── Lifecycle ─────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    _imagePath = widget.initialImagePath;
    _selectedDate = widget.preselectedDate ?? DateTime.now();

    _noteController.addListener(() {
      if (mounted) {
        setState(() => _hasText = _noteController.text.trim().isNotEmpty);
      }
    });

    _noteFocusNode.addListener(_onFocusChange);
    _fetchLocation();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _showCustomNumpad = true);
    });
  }

  @override
  void dispose() {
    _noteController.dispose();
    _amountController.dispose();
    _noteFocusNode
      ..removeListener(_onFocusChange)
      ..dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (_isFocusChanging || !mounted) return;
    _isFocusChanging = true;

    if (_noteFocusNode.hasFocus) {
      setState(() => _showCustomNumpad = false);
    } else {
      _hideSystemKeyboard();
    }

    Future.delayed(
      const Duration(milliseconds: 150),
      () => _isFocusChanging = false,
    );
  }

  void _hideSystemKeyboard() {
    try {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    } catch (_) {}
  }

  // ── Location ──────────────────────────────────────────────────────────────

  Future<void> _fetchLocation() async {
    try {
      if (!await Geolocator.isLocationServiceEnabled()) return;

      var permission = await Geolocator.checkPermission();
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

  // ── Save ──────────────────────────────────────────────────────────────────

  Future<void> _saveTransaction() async {
    final rawAmount = _amountController.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (rawAmount.isEmpty || rawAmount == '0') {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(_snackBar('⚠️ Vui lòng nhập số tiền', isError: true));
      return;
    }

    HapticFeedback.mediumImpact();
    if (!_locationFetched) await _fetchLocation();

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
      await Provider.of<TransactionProvider>(
        context,
        listen: false,
      ).addTransaction(transaction);
      if (!mounted) return;
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(_snackBar('❌ Lỗi khi lưu giao dịch: $e', isError: true));
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

  // ── Numpad ────────────────────────────────────────────────────────────────

  void _onNumberTap(String value) {
    if (!mounted) return;
    handleNumpadKey(
      value,
      _amountController,
      onDismissNumpad: () {
        _hideSystemKeyboard();
        _noteFocusNode.unfocus();
        setState(() => _showCustomNumpad = false);
      },
    );
    setState(() {}); // Cập nhật UI sau khi tính toán
  }

  // ── Pickers ───────────────────────────────────────────────────────────────

  void _showCategoryPicker() {
    HapticFeedback.selectionClick();
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => _CategoryPickerSheet(
        categories: _categories,
        selected: _selectedCategory,
        onSelect: (cat) {
          setState(() => _selectedCategory = cat);
          Navigator.pop(context);
        },
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

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_showCustomNumpad) setState(() => _showCustomNumpad = false);
        _noteFocusNode.unfocus();
        _hideSystemKeyboard();
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
              CustomNumpad(
                visible: _showCustomNumpad,
                onKeyTap: _onNumberTap,
                onDismiss: () => setState(() => _showCustomNumpad = false),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
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
                  ? const Row(
                      key: ValueKey('gps_on'),
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.cruelty_free, size: 14, color: Colors.blue),
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
                          style: TextStyle(color: Colors.white38, fontSize: 12),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard() {
    List<Color> smoothGradient(bool isExpense) {
      final start = isExpense
          ? const Color(0xFFE57878)
          : const Color.fromARGB(255, 122, 235, 99);
      const end = Color(0xFF3B3232);
      return List.generate(11, (i) => Color.lerp(start, end, i / 10)!);
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
                    colors: smoothGradient(_isExpense),
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
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                            color: _isExpense
                                ? const Color(0xFFFF5252)
                                : const Color(0xFF69F0AE),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          child: IntrinsicWidth(
                            child: GestureDetector(
                              onTap: () {
                                setState(() => _showCustomNumpad = true);
                                _noteFocusNode.unfocus();
                                _hideSystemKeyboard();
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
                                    return (raw == null ||
                                            raw.isEmpty ||
                                            raw == '0')
                                        ? ''
                                        : null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          'đ',
                          style: TextStyle(
                            fontSize: 20,
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
                              showCursor: true,
                              readOnly: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 7),
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
          // Category picker button
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
                    color: _selectedCategory.color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _selectedCategory.border,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _selectedCategory.icon,
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        _selectedCategory.label,
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

          // Type toggle
          Center(
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: Colors.white12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TypeChip(
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
                  TypeChip(
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
            ),
          ),
          const SizedBox(height: 14),

          // Date picker
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

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 20),
      decoration: const BoxDecoration(color: Colors.black),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ─────────────────────────────────────────
          // RETAKE CAMERA BUTTON
          // ─────────────────────────────────────────
          BottomAction(
            icon: Icons.flip_camera_ios_rounded,
            label: 'Chụp lại',

            onTap: () {
              HapticFeedback.selectionClick();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => CameraCaptureScreen(
                    preselectedDate: widget.preselectedDate,
                  ),
                ),
              );
            },
          ),

          // ─────────────────────────────────────────
          // SAVE BUTTON
          // ─────────────────────────────────────────
          GestureDetector(
            onTap: !_isValid
                ? null
                : () async {
                    HapticFeedback.mediumImpact();

                    setState(() => _isSaving = true);

                    await _saveTransaction();

                    if (mounted) {
                      setState(() => _isSaving = false);
                    }
                  },

            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,

              width: 68,
              height: 68,

              decoration: BoxDecoration(
                shape: BoxShape.circle,

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

                border: Border.all(
                  color: _isValid
                      ? Colors.white.withOpacity(0.15)
                      : Colors.white.withOpacity(0.05),
                  width: 1.2,
                ),

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

          // ─────────────────────────────────────────
          // POKEMON SUMMON BUTTON
          // ─────────────────────────────────────────
          Consumer2<TransactionProvider, PokemonProvider>(
            builder: (context, txProvider, pokemonProvider, _) {
              final validCount = txProvider.validTransactionCount;

              final canSummon = pokemonProvider.canSummon(validCount);

              final count = pokemonProvider.collected.length;

              final remaining = pokemonProvider.remainingToNextMilestone(
                validCount,
              );

              return Stack(
                clipBehavior: Clip.none,
                children: [
                  GestureDetector(
                    onTap: canSummon
                        ? () async {
                            await _pokemonController.onSummon(context);
                          }
                        : () {
                            HapticFeedback.lightImpact();

                            ScaffoldMessenger.of(context).showSnackBar(
                              _snackBar(
                                remaining > 0
                                    ? '🔒 Còn $remaining giao dịch nữa để triệu hồi!'
                                    : '🎉 Bạn đã sưu tầm tất cả Pokémon!',
                                isError: false,
                              ),
                            );
                          },

                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,

                      width: 52,
                      height: 52,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        gradient: canSummon
                            ? const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFFFFD700), Color(0xFFFF8C00)],
                              )
                            : const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFF2A2A2A), Color(0xFF1A1A1A)],
                              ),

                        border: Border.all(
                          color: canSummon
                              ? Colors.white.withOpacity(0.25)
                              : Colors.white.withOpacity(0.05),
                          width: 1.2,
                        ),

                        boxShadow: canSummon
                            ? [
                                BoxShadow(
                                  color: const Color(
                                    0xFFFFD700,
                                  ).withOpacity(0.45),
                                  blurRadius: 16,
                                  offset: const Offset(0, 4),
                                ),
                              ]
                            : [],
                      ),

                      child: Icon(
                        Icons.catching_pokemon_rounded,
                        size: 26,
                        color: canSummon
                            ? Colors.white.withOpacity(0.95)
                            : Colors.white24,
                      ),
                    ),
                  ),

                  if (count > 0)
                    Positioned(
                      top: -4,
                      right: -4,
                      child: Container(
                        padding: const EdgeInsets.all(3),

                        decoration: const BoxDecoration(
                          color: Color(0xFFFF8C00),
                          shape: BoxShape.circle,
                        ),

                        child: Text(
                          '$count',

                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                  if (!canSummon)
                    Positioned(
                      bottom: -2,
                      right: -2,

                      child: Container(
                        width: 16,
                        height: 16,

                        decoration: BoxDecoration(
                          color: const Color(0xFF333333),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white12, width: 1),
                        ),

                        child: const Icon(
                          Icons.lock,
                          size: 9,
                          color: Colors.white38,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

// ── Category picker sheet ──────────────────────────────────────────────────

class _CategoryPickerSheet extends StatelessWidget {
  const _CategoryPickerSheet({
    required this.categories,
    required this.selected,
    required this.onSelect,
  });

  final List<model.Category> categories;
  final model.Category selected;
  final ValueChanged<model.Category> onSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            children: categories.map((category) {
              final isSelected = category == selected;
              return GestureDetector(
                onTap: () => onSelect(category),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? category.color.withOpacity(0.8)
                        : Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? category.border
                          : Colors.white.withOpacity(0.12),
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(category.icon, style: const TextStyle(fontSize: 16)),
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
    );
  }
}
