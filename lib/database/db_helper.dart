import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/transaction.dart' as model;
import '../models/pokemon_models.dart';
import '../data/evolution_chains_data.dart';
class DBHelper {
  // ✅ Constant tên mặc định — tránh hardcode nhiều chỗ
  static const String defaultUserName = 'Nghĩa';

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
      version: 5, // ✅ Tăng lên v5 để thêm bảng Pokemon
      onCreate: _createDB,
      onUpgrade: _onUpgrade,
    );
  }

  // Tạo tất cả bảng (lần đầu cài app)
  Future _createDB(Database db, int version) async {
    // --- Bảng giao dịch tài chính ---
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

    await db.execute('''
      CREATE TABLE user_settings (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_name TEXT DEFAULT '$defaultUserName',
        greeting TEXT,
        greeting_emoji TEXT,
        greeting_hour INTEGER,
        greeting_date TEXT
      )
    ''');

    await db.insert('user_settings', {'user_name': defaultUserName});

    // --- Bảng Pokemon ---
    await db.execute('''
      CREATE TABLE collected_pokemon (
        id TEXT PRIMARY KEY,
        dex_number INTEGER NOT NULL,
        rarity TEXT NOT NULL,
        is_revealed INTEGER NOT NULL DEFAULT 0,
        obtained_at TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE summon_history (
        id TEXT PRIMARY KEY,
        pokemon_id TEXT NOT NULL,
        pulled_at TEXT NOT NULL,
        FOREIGN KEY (pokemon_id) REFERENCES collected_pokemon(id) ON DELETE CASCADE
      )
    ''');
  }

  // Migration theo từng version
  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // v1 → v2: thêm cột latitude & longitude
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE transactions ADD COLUMN latitude REAL');
      await db.execute('ALTER TABLE transactions ADD COLUMN longitude REAL');
    }

    // v2 → v3: thêm bảng user_settings
    if (oldVersion < 3) {
      await db.execute('''
        CREATE TABLE IF NOT EXISTS user_settings (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          user_name TEXT DEFAULT '$defaultUserName'
        )
      ''');
      final existing = await db.query('user_settings', limit: 1);
      if (existing.isEmpty) {
        await db.insert('user_settings', {'user_name': defaultUserName});
      }
    }

    // v3 → v4: thêm các cột greeting
    if (oldVersion < 4) {
      await db.execute('ALTER TABLE user_settings ADD COLUMN greeting TEXT');
      await db.execute('ALTER TABLE user_settings ADD COLUMN greeting_emoji TEXT');
      await db.execute('ALTER TABLE user_settings ADD COLUMN greeting_hour INTEGER');
      await db.execute('ALTER TABLE user_settings ADD COLUMN greeting_date TEXT');
    }

    // ✅ v4 → v5: thêm bảng Pokemon
    if (oldVersion < 5) {
      await db.execute('''
        CREATE TABLE IF NOT EXISTS collected_pokemon (
          id TEXT PRIMARY KEY,
          dex_number INTEGER NOT NULL,
          rarity TEXT NOT NULL,
          is_revealed INTEGER NOT NULL DEFAULT 0,
          obtained_at TEXT NOT NULL
        )
      ''');

      await db.execute('''
        CREATE TABLE IF NOT EXISTS summon_history (
          id TEXT PRIMARY KEY,
          pokemon_id TEXT NOT NULL,
          pulled_at TEXT NOT NULL,
          FOREIGN KEY (pokemon_id) REFERENCES collected_pokemon(id) ON DELETE CASCADE
        )
      ''');
    }
  }

  // ✅ Dùng trong testing để reset database
  Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
      _database = null;
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // USER SETTINGS
  // ═══════════════════════════════════════════════════════════════════════════

  Future<String> getUserName() async {
    final db = await database;
    final maps = await db.query('user_settings', columns: ['user_name'], limit: 1);
    if (maps.isEmpty) return defaultUserName;
    return maps[0]['user_name'] as String? ?? defaultUserName;
  }

  Future<void> updateUserName(String name) async {
    final db = await database;
    await db.update(
      'user_settings',
      {'user_name': name},
      where: 'id = ?',
      whereArgs: [1],
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TRANSACTIONS
  // ═══════════════════════════════════════════════════════════════════════════

  Future<void> insertTransaction(model.Transaction t) async {
    final db = await database;
    await db.insert(
      'transactions',
      t.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateTransaction(model.Transaction t) async {
    final db = await database;
    await db.update(
      'transactions',
      t.toMap(),
      where: 'id = ?',
      whereArgs: [t.id],
    );
  }

  Future<List<model.Transaction>> getAllTransactions() async {
    final db = await database;
    final maps = await db.query('transactions', orderBy: 'date DESC');
    return maps.map((m) => model.Transaction.fromMap(m)).toList();
  }

  Future<void> deleteTransaction(String id) async {
    final db = await database;
    await db.delete('transactions', where: 'id = ?', whereArgs: [id]);
  }

  // ✅ FIX: xử lý đúng tháng 12
  Future<List<model.Transaction>> getTransactionsByMonth(
    int year,
    int month,
  ) async {
    final db = await database;
    final start = DateTime(year, month, 1).toIso8601String();
    final end = month == 12
        ? DateTime(year + 1, 1, 1).toIso8601String()
        : DateTime(year, month + 1, 1).toIso8601String();

    final maps = await db.query(
      'transactions',
      where: 'date >= ? AND date < ?',
      whereArgs: [start, end],
      orderBy: 'date DESC',
    );
    return maps.map((m) => model.Transaction.fromMap(m)).toList();
  }

  Future<List<model.Transaction>> getTransactionsWithLocation() async {
    final db = await database;
    final maps = await db.query(
      'transactions',
      where: 'latitude IS NOT NULL AND longitude IS NOT NULL',
      orderBy: 'date DESC',
    );
    return maps.map((m) => model.Transaction.fromMap(m)).toList();
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // GREETING
  // ═══════════════════════════════════════════════════════════════════════════

  Future<void> saveGreeting(String greeting, String emoji, int hour) async {
    final db = await database;
    await db.update(
      'user_settings',
      {
        'greeting': greeting,
        'greeting_emoji': emoji,
        'greeting_hour': hour,
        'greeting_date': DateTime.now().toIso8601String(),
      },
      where: 'id = ?',
      whereArgs: [1],
    );
  }

  Future<Map<String, dynamic>?> getGreeting() async {
    final db = await database;
    final maps = await db.query('user_settings', limit: 1);
    if (maps.isEmpty) return null;

    final row = maps[0];
    if (row['greeting'] == null) return null;

    return {
      'greeting': row['greeting'] as String?,
      'emoji': row['greeting_emoji'] as String?,
      'hour': row['greeting_hour'] as int?,
      'date': row['greeting_date'] as String?,
    };
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // COLLECTED POKEMON
  // ═══════════════════════════════════════════════════════════════════════════

  Future<void> insertCollectedPokemon(CollectedPokemon pokemon) async {
    final db = await database;
    await db.insert(
      'collected_pokemon',
      pokemon.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateCollectedPokemon(CollectedPokemon pokemon) async {
    final db = await database;
    await db.update(
      'collected_pokemon',
      pokemon.toMap(),
      where: 'id = ?',
      whereArgs: [pokemon.id],
    );
  }

  Future<void> deleteCollectedPokemon(String id) async {
    final db = await database;
    await db.delete('collected_pokemon', where: 'id = ?', whereArgs: [id]);
  }

  // ✅ Reconstruct EvolutionChain từ kAllEvolutionChains khi load
  Future<List<CollectedPokemon>> getAllCollectedPokemon() async {
    final db = await database;
    final maps = await db.query('collected_pokemon', orderBy: 'obtained_at DESC');

    return maps.map((m) {
      final dexNumber = m['dex_number'] as int;

      // Lookup chain từ static data
      final chain = _findChainByDex(dexNumber) ??
          EvolutionChain(stages: [PokemonStage(name: 'unknown', dexNumber: dexNumber, stage: 1)]);

      final stage = chain.stages.firstWhere(
        (s) => s.dexNumber == dexNumber,
        orElse: () => chain.stages.first,
      );

      return CollectedPokemon.fromMap(m, stage, chain);
    }).toList();
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // SUMMON HISTORY
  // ═══════════════════════════════════════════════════════════════════════════

  Future<void> insertSummonRecord(SummonRecord record) async {
    final db = await database;
    await db.insert(
      'summon_history',
      record.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // ✅ Join với collected list đã load sẵn — tránh N+1 query
  Future<List<SummonRecord>> getAllSummonHistory(
    List<CollectedPokemon> collected,
  ) async {
    final db = await database;
    final maps = await db.query('summon_history', orderBy: 'pulled_at DESC');

    // Build lookup map để join nhanh
    final collectedMap = {for (final p in collected) p.id: p};

    final result = <SummonRecord>[];
    for (final m in maps) {
      final pokemonId = m['pokemon_id'] as String;
      final pokemon = collectedMap[pokemonId];
      if (pokemon == null) continue; // orphan record — bỏ qua

      result.add(SummonRecord(
        id: m['id'] as String,
        pokemon: pokemon,
        pulledAt: DateTime.parse(m['pulled_at'] as String),
      ));
    }
    return result;
  }

  // ─── Helpers ──────────────────────────────────────────────────────────────

  EvolutionChain? _findChainByDex(int dexNumber) {
    try {
      return kAllEvolutionChains.firstWhere(
        (chain) => chain.stages.any((s) => s.dexNumber == dexNumber),
      );
    } catch (_) {
      return null;
    }
  }
}