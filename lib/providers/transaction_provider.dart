// lib/providers/transaction_provider.dart
// Provider = "trung tâm dữ liệu" — UI lắng nghe và tự cập nhật khi data thay đổi

import 'package:flutter/foundation.dart';
import '../models/transaction.dart' as model;
import '../database/db_helper.dart';
import 'dart:math';

class TransactionProvider with ChangeNotifier {
  List<model.Transaction> _transactions = [];
  String _userName = 'Nghĩa';

  String _greeting = '';
  String _greetingEmoji = '';

  // ✅ MỚI: Tracking states để tránh load nhiều lần
  bool _isLoading = false;
  bool _isLoaded = false;
  String? _loadError;

  // ✅ Getters cho states
  bool get isLoading => _isLoading;
  bool get isLoaded => _isLoaded;
  String? get loadError => _loadError;

  List<model.Transaction> get transactions => _transactions;
  String get userName => _userName;
  String get greeting => _greeting;
  String get greetingEmoji => _greetingEmoji;

  // ➕ Load greeting từ DB
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
            ? DateTime.parse(storedDateStr)
            : null;

        // Kiểm tra xem có cần random lại không
        bool shouldRefresh = false;

        // Nếu đã qua ngày mới → random lại
        if (storedDate != null &&
            (now.year != storedDate.year ||
                now.month != storedDate.month ||
                now.day != storedDate.day)) {
          shouldRefresh = true;
        }

        // Nếu đã sang khung giờ khác → random lại
        if (!shouldRefresh &&
            _getTimeSlot(storedHour) != _getTimeSlot(now.hour)) {
          shouldRefresh = true;
        }

        if (!shouldRefresh) {
          // Dùng greeting cũ
          _greeting = greetingData['greeting'] as String;
          _greetingEmoji = greetingData['emoji'] as String;
          notifyListeners();
          return;
        }
      }

      // Random greeting mới
      _generateNewGreeting(now.hour);
    } catch (e) {
      // ✅ Silent fail cho greeting (không critical)
      if (kDebugMode) {
        print('Error loading greeting: $e');
      }
    }
  }

  // ➕ Generate greeting mới và lưu vào DB
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

    // Lưu vào DB (không await để không block)
    DBHelper.instance.saveGreeting(_greeting, _greetingEmoji, hour).catchError((
      e,
    ) {
      if (kDebugMode) {
        print('Error saving greeting: $e');
      }
    });

    notifyListeners();
  }

  // ➕ Helper để xác định time slot
  int _getTimeSlot(int hour) {
    if (hour >= 5 && hour < 8) return 1;
    if (hour >= 8 && hour < 12) return 2;
    if (hour >= 12 && hour < 14) return 3;
    if (hour >= 14 && hour < 18) return 4;
    if (hour >= 18 && hour < 22) return 5;
    return 6;
  }

  // ✅ MỚI: Load tất cả dữ liệu với proper error handling
  Future<void> loadAllData() async {
    // ✅ Tránh load nhiều lần
    if (_isLoaded || _isLoading) return;

    _isLoading = true;
    _loadError = null;
    notifyListeners();

    try {
      // ✅ Load song song để tăng tốc độ
      await Future.wait([loadTransactions(), loadUserName(), loadGreeting()]);

      _isLoaded = true;
    } catch (e) {
      _loadError = e.toString();
      if (kDebugMode) {
        print('Error loading data: $e');
      }
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ✅ MỚI: Reset state (dùng khi cần reload)
  void reset() {
    _isLoaded = false;
    _isLoading = false;
    _loadError = null;
  }

  // ✅ MỚI: Retry load khi có lỗi
  Future<void> retryLoad() async {
    reset();
    await loadAllData();
  }

  // Tải tên người dùng từ DB
  Future<void> loadUserName() async {
    try {
      _userName = await DBHelper.instance.getUserName();
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Error loading username: $e');
      }
      // ✅ Silent fail, giữ default value
    }
  }

  // Cập nhật tên người dùng
  Future<void> updateUserName(String name) async {
    await DBHelper.instance.updateUserName(name);
    _userName = name;
    notifyListeners();
  }

  // Tổng số dư = tổng thu - tổng chi
  double get balance {
    return _transactions.fold(0, (sum, t) {
      return t.type == model.TransactionType.income
          ? sum + t.amount
          : sum - t.amount;
    });
  }

  // Tổng thu trong danh sách hiện tại
  double get totalIncome {
    return _transactions
        .where((t) => t.type == model.TransactionType.income)
        .fold(0, (sum, t) => sum + t.amount);
  }

  // Tổng chi trong danh sách hiện tại
  double get totalExpense {
    return _transactions
        .where((t) => t.type == model.TransactionType.expense)
        .fold(0, (sum, t) => sum + t.amount);
  }

  // Tải tất cả giao dịch từ DB
  Future<void> loadTransactions() async {
    try {
      _transactions = await DBHelper.instance.getAllTransactions();
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Error loading transactions: $e');
      }
      _transactions = [];
      notifyListeners();
    }
  }

  // Thêm giao dịch mới
  Future<void> addTransaction(model.Transaction t) async {
    await DBHelper.instance.insertTransaction(t);
    await loadTransactions();
  }

  // Cập nhật giao dịch đã có
  Future<void> updateTransaction(model.Transaction t) async {
    await DBHelper.instance.updateTransaction(t);
    await loadTransactions();
  }

  // Xoá giao dịch
  Future<void> deleteTransaction(String id) async {
    await DBHelper.instance.deleteTransaction(id);
    await loadTransactions();
  }

  // Lấy dữ liệu theo từng danh mục (dùng cho biểu đồ tròn)
  Map<model.Category, double> get expenseByCategory {
    final Map<model.Category, double> result = {};
    for (var t in _transactions) {
      if (t.type == model.TransactionType.expense) {
        result[t.category] = (result[t.category] ?? 0) + t.amount;
      }
    }
    return result;
  }

  // ✅ MỚI: Get transactions theo ngày (dùng cho báo cáo)
  List<model.Transaction> getTransactionsByDate(DateTime date) {
    return _transactions.where((t) {
      return t.date.year == date.year &&
          t.date.month == date.month &&
          t.date.day == date.day;
    }).toList();
  }

  // ✅ MỚI: Get transactions theo tháng
  List<model.Transaction> getTransactionsByMonth(int year, int month) {
    return _transactions.where((t) {
      return t.date.year == year && t.date.month == month;
    }).toList();
  }

  // ✅ MỚI: Clear all data (dùng khi logout)
  Future<void> clearAllData() async {
    _transactions = [];
    _userName = 'Nghĩa';
    _greeting = '';
    _greetingEmoji = '';
    _isLoaded = false;
    notifyListeners();
  }

  @override
  void dispose() {
    // ✅ Cleanup khi provider bị dispose
    _transactions.clear();
    super.dispose();
  }
}
