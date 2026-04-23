// lib/providers/transaction_provider.dart
// Provider = "trung tâm dữ liệu" — UI lắng nghe và tự cập nhật khi data thay đổi

import 'package:flutter/foundation.dart';
import '../models/transaction.dart' as model;
import '../database/db_helper.dart';
import 'dart:math';

class TransactionProvider with ChangeNotifier {
  List<model.Transaction> _transactions = [];
  String _userName = DBHelper.defaultUserName;

  String _greeting = '';
  String _greetingEmoji = '';

  bool _isLoading = false;
  bool _isLoaded = false;

  // ✅ FIX: Tách _loadError riêng cho từng loại để UI xử lý tốt hơn
  String? _loadError;

  // Getters
  bool get isLoading => _isLoading;
  bool get isLoaded => _isLoaded;
  String? get loadError => _loadError;
  List<model.Transaction> get transactions => List.unmodifiable(_transactions);
  String get userName => _userName;
  String get greeting => _greeting;
  String get greetingEmoji => _greetingEmoji;

  // Tổng số dư = tổng thu - tổng chi
  double get balance {
    return _transactions.fold(0.0, (sum, t) {
      return t.type == model.TransactionType.income
          ? sum + t.amount
          : sum - t.amount;
    });
  }

  // Tổng thu
  double get totalIncome {
    return _transactions
        .where((t) => t.type == model.TransactionType.income)
        .fold(0.0, (sum, t) => sum + t.amount);
  }

  // Tổng chi
  double get totalExpense {
    return _transactions
        .where((t) => t.type == model.TransactionType.expense)
        .fold(0.0, (sum, t) => sum + t.amount);
  }

  // ✅ FIX: loadAllData — error handling nhất quán
  // Các hàm con (loadTransactions, loadUserName) không tự catch nữa
  // để lỗi có thể bubble up đúng cách vào _loadError
  Future<void> loadAllData() async {
    if (_isLoaded || _isLoading) return;

    _isLoading = true;
    _loadError = null;
    notifyListeners();

    try {
      await Future.wait([
        _loadTransactionsInternal(),
        _loadUserNameInternal(),
        loadGreeting(),
      ]);
      _isLoaded = true;
    } catch (e) {
      _loadError = e.toString();
      if (kDebugMode) print('Error loading data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ✅ Internal loaders — throw thay vì silent fail (để loadAllData bắt được)
  Future<void> _loadTransactionsInternal() async {
    _transactions = await DBHelper.instance.getAllTransactions();
  }

  Future<void> _loadUserNameInternal() async {
    _userName = await DBHelper.instance.getUserName();
  }

  // ✅ Public reload — dùng khi cần refresh thủ công (pull-to-refresh, v.v.)
  Future<void> loadTransactions() async {
    try {
      _transactions = await DBHelper.instance.getAllTransactions();
      notifyListeners();
    } catch (e) {
      if (kDebugMode) print('Error reloading transactions: $e');
    }
  }

  // Tải tên người dùng
  Future<void> loadUserName() async {
    try {
      _userName = await DBHelper.instance.getUserName();
      notifyListeners();
    } catch (e) {
      if (kDebugMode) print('Error loading username: $e');
    }
  }

  // Reset state
  void reset() {
    _isLoaded = false;
    _isLoading = false; // ✅ FIX: reset cả _isLoading (tránh stuck)
    _loadError = null;
  }

  // Retry khi có lỗi
  Future<void> retryLoad() async {
    reset();
    await loadAllData();
  }

  // Cập nhật tên người dùng
  Future<void> updateUserName(String name) async {
    await DBHelper.instance.updateUserName(name);
    _userName = name;
    notifyListeners();
  }

  // ✅ FIX: Thêm giao dịch — cập nhật list local thay vì reload toàn bộ DB
  Future<void> addTransaction(model.Transaction t) async {
    await DBHelper.instance.insertTransaction(t);
    _transactions.insert(0, t); // Mới nhất lên đầu
    notifyListeners();
  }

  // ✅ FIX: Cập nhật giao dịch — tìm và thay thế trong list local
  Future<void> updateTransaction(model.Transaction t) async {
    await DBHelper.instance.updateTransaction(t);
    final index = _transactions.indexWhere((tx) => tx.id == t.id);
    if (index != -1) {
      _transactions[index] = t;
      notifyListeners();
    }
  }

  // ✅ FIX: Xoá giao dịch — remove khỏi list local
  Future<void> deleteTransaction(String id) async {
    await DBHelper.instance.deleteTransaction(id);
    _transactions.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  // Lấy dữ liệu theo danh mục (dùng cho biểu đồ tròn)
  Map<model.Category, double> get expenseByCategory {
    final Map<model.Category, double> result = {};
    for (final t in _transactions) {
      if (t.type == model.TransactionType.expense) {
        result[t.category] = (result[t.category] ?? 0.0) + t.amount;
      }
    }
    return result;
  }

  // Lấy transactions theo ngày
  List<model.Transaction> getTransactionsByDate(DateTime date) {
    return _transactions.where((t) {
      return t.date.year == date.year &&
          t.date.month == date.month &&
          t.date.day == date.day;
    }).toList();
  }

  // Lấy transactions theo tháng
  List<model.Transaction> getTransactionsByMonth(int year, int month) {
    return _transactions.where((t) {
      return t.date.year == year && t.date.month == month;
    }).toList();
  }

  // ✅ Clear all (khi logout)
  Future<void> clearAllData() async {
    _transactions = [];
    _userName = DBHelper.defaultUserName;
    _greeting = '';
    _greetingEmoji = '';
    _isLoaded = false;
    _isLoading = false; // ✅ FIX: reset cả _isLoading
    _loadError = null;
    notifyListeners();
  }

  // ─── Greeting ────────────────────────────────────────────────────────────

  Future<void> loadGreeting() async {
    try {
      final greetingData = await DBHelper.instance.getGreeting();
      final now = DateTime.now();

      if (greetingData != null &&
          greetingData['greeting'] != null &&
          greetingData['hour'] != null) {
        final storedHour = greetingData['hour'] as int;
        final storedDateStr = greetingData['date'] as String?;
        final storedDate = storedDateStr != null
            ? DateTime.tryParse(storedDateStr)
            : null;

        bool shouldRefresh = false;

        // Qua ngày mới → random lại
        if (storedDate != null &&
            (now.year != storedDate.year ||
                now.month != storedDate.month ||
                now.day != storedDate.day)) {
          shouldRefresh = true;
        }

        // Sang khung giờ khác → random lại
        if (!shouldRefresh &&
            _getTimeSlot(storedHour) != _getTimeSlot(now.hour)) {
          shouldRefresh = true;
        }

        if (!shouldRefresh) {
          _greeting = greetingData['greeting'] as String;
          _greetingEmoji = greetingData['emoji'] as String? ?? '👋';
          notifyListeners();
          return;
        }
      }

      _generateNewGreeting(now.hour);
    } catch (e) {
      if (kDebugMode) print('Error loading greeting: $e');
      // Silent fail — greeting không critical
    }
  }

  void _generateNewGreeting(int hour) {
    final random = Random();

    String emoji;
    List<String> messages;

    if (hour >= 5 && hour < 8) {
      emoji = '🌅';
      messages = [
        'Dậy sớm thế, ngày mới tốt lành nhé!',
        'Chào buổi sáng sớm!',
        'Một ngày mới bắt đầu rồi!',
        'Hít thở không khí trong lành nào!',
        'Bắt đầu nhẹ nhàng thôi!',
      ];
    } else if (hour >= 8 && hour < 12) {
      emoji = '☀️';
      messages = [
        'Chào buổi sáng! Hôm nay bạn ổn chứ?',
        'Chúc bạn một buổi sáng thật hiệu quả!',
        'Bắt đầu ngày mới vui vẻ nhé!',
        'Làm việc tập trung nhé!',
        'Đừng quên uống nước!',
      ];
    } else if (hour >= 12 && hour < 14) {
      emoji = '🍜';
      messages = [
        'Đến giờ ăn trưa rồi!',
        'Chào buổi trưa! Nghỉ ngơi chút đi nào.',
        'Ăn trưa đầy đủ nha!',
        'Nạp năng lượng thôi!',
        'Ăn ngon miệng nhé!',
      ];
    } else if (hour >= 14 && hour < 18) {
      emoji = '🌤️';
      messages = [
        'Chào buổi chiều!',
        'Cố thêm chút nữa là hết ngày rồi!',
        'Buổi chiều thư giãn nhé!',
        'Giữ tinh thần nhé!',
        'Sắp xong việc rồi!',
      ];
    } else if (hour >= 18 && hour < 22) {
      emoji = '🌆';
      messages = [
        'Chào buổi tối!',
        'Tối rồi, nhớ nghỉ ngơi nhé!',
        'Chúc bạn một buổi tối dễ chịu!',
        'Thả lỏng một chút nhé!',
        'Đừng làm việc quá sức!',
      ];
    } else {
      emoji = '🌙';
      messages = [
        'Khuya rồi đó!',
        'Chúc bạn ngủ ngon nhé!',
        'Đừng thức khuya quá nha!',
        'Ngủ sớm đi nhé!',
        'Tắt máy và nghỉ ngơi thôi nào!',
      ];
    }

    _greeting = messages[random.nextInt(messages.length)];
    _greetingEmoji = emoji;

    DBHelper.instance.saveGreeting(_greeting, _greetingEmoji, hour).catchError((
      e,
    ) {
      if (kDebugMode) print('Error saving greeting: $e');
    });

    notifyListeners();
  }

  int _getTimeSlot(int hour) {
    if (hour >= 5 && hour < 8) return 1;
    if (hour >= 8 && hour < 12) return 2;
    if (hour >= 12 && hour < 14) return 3;
    if (hour >= 14 && hour < 18) return 4;
    if (hour >= 18 && hour < 22) return 5;
    return 6;
  }

  @override
  void dispose() {
    _transactions.clear();
    super.dispose();
  }
}
