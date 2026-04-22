import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/transaction.dart' as model;

class DBHelper {
  // Singleton — chỉ tạo 1 instance duy nhất trong toàn app
  static final DBHelper instance = DBHelper._init();
  static Database? _database;
  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('capmoney.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 4,
      onCreate: _createDB,
      onUpgrade: _onUpgrade,
    );
  }

  // Tạo bảng transactions (lần đầu cài app)
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE transactions (
        id TEXT PRIMARY KEY,
        amount REAL NOT NULL,
        type INTEGER NOT NULL,
        category INTEGER NOT NULL,
        note TEXT,
        date TEXT NOT NULL,
        imagePath TEXT,
        latitude REAL,
        longitude REAL
      )
    ''');

    // Thêm bảng user_settings
    await db.execute('''
      CREATE TABLE user_settings (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_name TEXT DEFAULT 'Nghĩa',
        greeting TEXT,
        greeting_emoji TEXT,
        greeting_hour INTEGER,
        greeting_date TEXT
      )
    ''');

    // Insert default user
    await db.insert('user_settings', {'user_name': 'Nghĩa'});
  }

  // Migration theo từng version
  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // v1 → v2: thêm cột latitude & longitude vào bảng transactions
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE transactions ADD COLUMN latitude REAL');
      await db.execute('ALTER TABLE transactions ADD COLUMN longitude REAL');
    }

    // v2 → v3: thêm bảng user_settings
    if (oldVersion < 3) {
      // Kiểm tra bảng chưa tồn tại trước khi tạo (phòng trường hợp chạy lại)
      await db.execute('''
        CREATE TABLE IF NOT EXISTS user_settings (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          user_name TEXT DEFAULT 'Nghĩa'
        )
      ''');
      final existing = await db.query('user_settings', limit: 1);
      if (existing.isEmpty) {
        await db.insert('user_settings', {'user_name': 'Nghĩa'});
      }
    }
    if (oldVersion < 4) {
      await db.execute('ALTER TABLE user_settings ADD COLUMN greeting TEXT');
      await db.execute(
        'ALTER TABLE user_settings ADD COLUMN greeting_emoji TEXT',
      );
      await db.execute(
        'ALTER TABLE user_settings ADD COLUMN greeting_hour INTEGER',
      );
      await db.execute(
        'ALTER TABLE user_settings ADD COLUMN greeting_date TEXT',
      );
    }
  }

  // Lấy tên người dùng
  Future<String> getUserName() async {
    final db = await database;
    final maps = await db.query('user_settings', limit: 1);
    if (maps.isEmpty) {
      return 'Nghĩa';
    }
    return maps[0]['user_name'] as String? ?? 'Nghĩa';
  }

  // Cập nhật tên người dùng
  Future<void> updateUserName(String name) async {
    final db = await database;
    await db.update(
      'user_settings',
      {'user_name': name},
      where: 'id = ?',
      whereArgs: [1],
    );
  }

  // ➕ Thêm giao dịch mới
  Future<void> insertTransaction(model.Transaction t) async {
    final db = await database;
    await db.insert(
      'transactions',
      t.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // ✏️ Cập nhật giao dịch đã tồn tại (chỉ update đúng record theo id)
  Future<void> updateTransaction(model.Transaction t) async {
    final db = await database;
    await db.update(
      'transactions',
      t.toMap(),
      where: 'id = ?',
      whereArgs: [t.id],
    );
  }

  // 📋 Lấy tất cả giao dịch, mới nhất lên đầu
  Future<List<model.Transaction>> getAllTransactions() async {
    final db = await database;
    final maps = await db.query('transactions', orderBy: 'date DESC');
    return maps.map((m) => model.Transaction.fromMap(m)).toList();
  }

  // 🗑️ Xoá giao dịch theo ID
  Future<void> deleteTransaction(String id) async {
    final db = await database;
    await db.delete('transactions', where: 'id = ?', whereArgs: [id]);
  }

  // 📅 Lấy giao dịch theo tháng (dùng cho thống kê)
  Future<List<model.Transaction>> getTransactionsByMonth(
    int year,
    int month,
  ) async {
    final db = await database;
    final start = DateTime(year, month, 1).toIso8601String();
    final end = DateTime(year, month + 1, 1).toIso8601String();

    final maps = await db.query(
      'transactions',
      where: 'date >= ? AND date < ?',
      whereArgs: [start, end],
      orderBy: 'date DESC',
    );
    return maps.map((m) => model.Transaction.fromMap(m)).toList();
  }

  // 📍 Lấy giao dịch có vị trí GPS (dùng cho bản đồ)
  Future<List<model.Transaction>> getTransactionsWithLocation() async {
    final db = await database;
    final maps = await db.query(
      'transactions',
      where: 'latitude IS NOT NULL AND longitude IS NOT NULL',
      orderBy: 'date DESC',
    );
    return maps.map((m) => model.Transaction.fromMap(m)).toList();
  }

  // Lưu greeting đã chọn + thời điểm chọn
  Future<void> saveGreeting(String greeting, String emoji, int hour) async {
    final db = await database;
    await db.insert('user_settings', {
      'greeting': greeting,
      'greeting_emoji': emoji,
      'greeting_hour': hour,
      'greeting_date': DateTime.now().toIso8601String(),
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Lấy greeting đã lưu
  Future<Map<String, dynamic>?> getGreeting() async {
    final db = await database;
    final maps = await db.query('user_settings', limit: 1);
    if (maps.isEmpty) return null;

    return {
      'greeting': maps[0]['greeting'] as String?,
      'emoji': maps[0]['greeting_emoji'] as String?,
      'hour': maps[0]['greeting_hour'] as int?,
      'date': maps[0]['greeting_date'] as String?,
    };
  }
}
