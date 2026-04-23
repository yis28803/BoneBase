// Đây là "khuôn mẫu" cho mỗi giao dịch thu/chi
import 'package:flutter/material.dart';

enum TransactionType { income, expense }

// Danh mục chi tiêu
enum Category {
  food, // Ăn uống
  transport, // Di chuyển
  shopping, // Mua sắm
  health, // Sức khoẻ
  entertainment, // Giải trí
  salary, // Lương
  bonus, // Thưởng
  investment, // Đầu tư
  other, // Khác
}

// Tên hiển thị + icon cho từng danh mục
extension CategoryExtension on Category {
  String get label {
    switch (this) {
      case Category.food:
        return 'Ăn uống';
      case Category.transport:
        return 'Di chuyển';
      case Category.shopping:
        return 'Mua sắm';
      case Category.health:
        return 'Sức khoẻ';
      case Category.entertainment:
        return 'Giải trí';
      case Category.salary:
        return 'Lương';
      case Category.bonus:
        return 'Thưởng';
      case Category.investment:
        return 'Đầu tư';
      case Category.other:
        return 'Khác';
    }
  }

  String get icon {
    switch (this) {
      case Category.food:
        return '🍱';
      case Category.transport:
        return '🏎️';
      case Category.shopping:
        return '🏷️';
      case Category.health:
        return '🩺';
      case Category.entertainment:
        return '🎡';
      case Category.salary:
        return '💰';
      case Category.bonus:
        return '🌟';
      case Category.investment:
        return '📈';
      case Category.other:
        return '🌀';
    }
  }

  Color get color {
    switch (this) {
      case Category.food:
        return const Color(0xFFFF6B35);
      case Category.transport:
        return const Color(0xFF45B7D1);
      case Category.shopping:
        return const Color(0xFFFF6B6B);
      case Category.health:
        return const Color(0xFFDC143C);
      case Category.entertainment:
        return const Color(0xFF7851A9);
      case Category.salary:
        return const Color(0xFF50C878);
      case Category.bonus:
        return const Color(0xFFF9C74F);
      case Category.investment:
        return const Color(0xFF4ECDC4);
      case Category.other:
        return const Color(0xFF708090);
    }
  }

  Color get border {
    switch (this) {
      case Category.food:
        return const Color(0xFFE55A2B);
      case Category.transport:
        return const Color(0xFF3AA3BA);
      case Category.shopping:
        return const Color(0xFFE55A5A);
      case Category.health:
        return const Color(0xFFBA1132);
      case Category.entertainment:
        return const Color(0xFF66458F);
      case Category.salary:
        return const Color(0xFF45B069);
      case Category.bonus:
        return const Color(0xFFE0B346);
      case Category.investment:
        return const Color(0xFF45B4AC);
      case Category.other:
        return const Color(0xFF5F6D7D);
    }
  }
}

class Transaction {
  final String id;
  final double amount;
  final TransactionType type;
  final Category category;
  final String note;
  final DateTime date;
  final String? imagePath;
  final double? latitude;
  final double? longitude;

  const Transaction({
    required this.id,
    required this.amount,
    required this.type,
    required this.category,
    required this.note,
    required this.date,
    this.imagePath,
    this.latitude,
    this.longitude,
  });

  /// Kiểm tra giao dịch có vị trí hợp lệ không
  bool get hasLocation => latitude != null && longitude != null;

  // ✅ MỚI: copyWith — dùng khi edit transaction, không cần tạo lại thủ công
  Transaction copyWith({
    String? id,
    double? amount,
    TransactionType? type,
    Category? category,
    String? note,
    DateTime? date,
    String? imagePath,
    double? latitude,
    double? longitude,
    bool clearImagePath = false,
    bool clearLocation = false,
  }) {
    return Transaction(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      category: category ?? this.category,
      note: note ?? this.note,
      date: date ?? this.date,
      imagePath: clearImagePath ? null : (imagePath ?? this.imagePath),
      latitude: clearLocation ? null : (latitude ?? this.latitude),
      longitude: clearLocation ? null : (longitude ?? this.longitude),
    );
  }

  // Chuyển sang Map để lưu vào SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'type': type.index,
      'category': category.index,
      'note': note,
      'date': date.toIso8601String(),
      'imagePath': imagePath,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  // Tạo Transaction từ Map (khi đọc từ SQLite)
  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'] as String,
      amount: (map['amount'] as num).toDouble(),
      type: TransactionType.values[map['type'] as int],
      category: Category.values[map['category'] as int],
      note: map['note'] as String? ?? '',
      date: DateTime.parse(map['date'] as String),
      imagePath: map['imagePath'] as String?,
      latitude: map['latitude'] != null
          ? (map['latitude'] as num).toDouble()
          : null,
      longitude: map['longitude'] != null
          ? (map['longitude'] as num).toDouble()
          : null,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Transaction &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'Transaction(id: $id, amount: $amount, type: $type, category: $category, date: $date)';
}
