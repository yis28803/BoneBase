// lib/features/pokemon/providers/pokemon_provider.dart
// Giống TransactionProvider — UI lắng nghe và tự cập nhật khi data thay đổi

import 'package:flutter/foundation.dart';
import 'dart:math';
import '../models/pokemon_models.dart';
import '../../../database/db_helper.dart';
import '../data/evolution_chains_data.dart';
import '../data/pokemon_meta_data.dart';

class PokemonProvider with ChangeNotifier {
  List<CollectedPokemon> _collected = [];
  List<SummonRecord> _pullHistory = [];

  bool _isLoading = false;
  bool _isLoaded = false;
  String? _loadError;

  // ─── Getters ─────────────────────────────────────────────────────────────

  bool get isLoading => _isLoading;
  bool get isLoaded => _isLoaded;
  String? get loadError => _loadError;

  List<CollectedPokemon> get collected => List.unmodifiable(_collected);
  List<SummonRecord> get pullHistory => List.unmodifiable(_pullHistory);

  // Set dex number đã sở hữu — dùng nhanh cho buildSummonPool
  Set<int> get ownedDexNumbers =>
      _collected.map((p) => p.stage.dexNumber).toSet();

  // ─── Summon Gate ──────────────────────────────────────────────────────────
  //
  // canSummon(validCount) = true khi:
  //   1. validCount đã đạt ít nhất 1 mốc bội số 5 (validCount >= 5)
  //   2. Số mốc đã đạt được (validCount ~/ 5) > số lần đã summon (pullHistory.length)
  //      → tức là còn ít nhất 1 lượt chưa dùng tại mốc hiện tại
  //   3. Collection chưa đầy
  //
  // Lưu ý: lượt không tích lũy — chỉ so sánh mốc hiện tại với số lần đã summon.
  // Ví dụ: validCount=15, pullHistory.length=2 → 15~/5=3 > 2 → canSummon=true (còn 1 lượt)
  //        validCount=15, pullHistory.length=3 → 15~/5=3 > 3 → false (đã dùng hết mốc 15)
  //        validCount=16, pullHistory.length=3 → 16~/5=3 > 3 → false (chưa tới mốc 20)

  bool canSummon(int validTransactionCount) {
    if (isCollectionComplete) return false;
    if (validTransactionCount < 5) return false;

    final unlockedMilestones = validTransactionCount ~/ 5;
    final usedSummons = _pullHistory.length;

    return unlockedMilestones > usedSummons;
  }

  // Số giao dịch hợp lệ còn thiếu để tới mốc tiếp theo
  // (dùng để hiển thị hint cho user, ví dụ "Còn 3 giao dịch nữa")
  int remainingToNextMilestone(int validTransactionCount) {
    final nextMilestone = (_pullHistory.length + 1) * 5;
    final remaining = nextMilestone - validTransactionCount;
    return remaining > 0 ? remaining : 0;
  }

  // ─── Load ─────────────────────────────────────────────────────────────────

  Future<void> loadAllData() async {
    if (_isLoaded || _isLoading) return;

    _isLoading = true;
    _loadError = null;
    notifyListeners();

    try {
      await Future.wait([
        _loadCollectedInternal(),
        _loadPullHistoryInternal(),
      ]);
      _isLoaded = true;
    } catch (e) {
      _loadError = e.toString();
      if (kDebugMode) print('PokemonProvider error loading data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _loadCollectedInternal() async {
    _collected = await DBHelper.instance.getAllCollectedPokemon();
  }

  Future<void> _loadPullHistoryInternal() async {
    _pullHistory = await DBHelper.instance.getAllSummonHistory(_collected);
  }

  // Public reload — dùng khi cần refresh thủ công
  Future<void> loadCollected() async {
    try {
      _collected = await DBHelper.instance.getAllCollectedPokemon();
      notifyListeners();
    } catch (e) {
      if (kDebugMode) print('Error reloading collected: $e');
    }
  }

  // ─── Reset / Retry ────────────────────────────────────────────────────────

  void reset() {
    _isLoaded = false;
    _isLoading = false;
    _loadError = null;
  }

  Future<void> retryLoad() async {
    reset();
    await loadAllData();
  }

  // ─── Summon Logic ─────────────────────────────────────────────────────────

  // Giống buildSummonPool trong HomeController cũ — giờ sống ở Provider
  List<PokemonStage> buildSummonPool() {
    final ownedDex = ownedDexNumbers;
    final pool = <PokemonStage>[];

    for (final chain in kAllEvolutionChains) {
      for (int i = 0; i < chain.stages.length; i++) {
        final stage = chain.stages[i];

        // Bỏ qua nếu đã sở hữu
        if (ownedDex.contains(stage.dexNumber)) continue;

        // Base form luôn có thể summon
        if (i == 0) {
          pool.add(stage);
        } else {
          // Evolution chỉ summon được nếu đã sở hữu form trước
          final prevDex = chain.stages[i - 1].dexNumber;
          if (ownedDex.contains(prevDex)) {
            pool.add(stage);
          }
        }
      }
    }

    return pool;
  }

  bool get isCollectionComplete => buildSummonPool().isEmpty;

  // ─── CRUD ─────────────────────────────────────────────────────────────────

  // ✅ Thêm Pokemon mới — cập nhật list local, không reload toàn DB
  Future<void> addCollected(CollectedPokemon pokemon) async {
    await DBHelper.instance.insertCollectedPokemon(pokemon);
    _collected.insert(0, pokemon); // Mới nhất lên đầu
    notifyListeners();
  }

  // ✅ Cập nhật Pokemon (ví dụ: isRevealed) — tìm và thay thế trong list local
  Future<void> updateCollected(CollectedPokemon pokemon) async {
    await DBHelper.instance.updateCollectedPokemon(pokemon);
    final index = _collected.indexWhere((p) => p.id == pokemon.id);
    if (index != -1) {
      _collected[index] = pokemon;
      notifyListeners();
    }
  }

  // ✅ Xoá Pokemon — remove khỏi list local
  Future<void> deleteCollected(String id) async {
    await DBHelper.instance.deleteCollectedPokemon(id);
    _collected.removeWhere((p) => p.id == id);
    notifyListeners();
  }

  // ✅ Thêm summon record
  Future<void> addSummonRecord(SummonRecord record) async {
    await DBHelper.instance.insertSummonRecord(record);
    _pullHistory.insert(0, record);
    notifyListeners();
  }

  // ─── Summon (thay thế onSummon trong HomeController) ─────────────────────

  // Trả về Pokemon được summon, hoặc null nếu collection đã đầy
  // UI (HomeController) chịu trách nhiệm navigation/toast
  Future<CollectedPokemon?> performSummon() async {
    final pool = buildSummonPool();
    if (pool.isEmpty) return null;

    final random = Random();
    final stage = pool[random.nextInt(pool.length)];

    final chain = _findChainByDex(stage.dexNumber) ??
        EvolutionChain(stages: [stage]);

    final pokemon = CollectedPokemon(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      stage: stage,
      chain: chain,
      obtainedAt: DateTime.now(),
      rarity: stage.rarity,
    );

    return pokemon;
  }

  // Gọi sau khi user xem xong màn hình summon và confirm
  Future<void> confirmSummon(CollectedPokemon pokemon) async {
    final record = SummonRecord(
      id: '${pokemon.id}_record',
      pokemon: pokemon,
      pulledAt: DateTime.now(),
    );
    await addCollected(pokemon);
    await addSummonRecord(record);
  }

  // ─── Queries ──────────────────────────────────────────────────────────────

  // Lấy history của một Pokemon cụ thể
  List<SummonRecord> getHistoryForPokemon(String pokemonId) {
    return _pullHistory
        .where((r) => r.pokemon.id == pokemonId)
        .toList();
  }

  // Lấy collected theo rarity
  List<CollectedPokemon> getCollectedByRarity(String rarity) {
    return _collected.where((p) => p.rarity == rarity).toList();
  }

  // ─── Clear ────────────────────────────────────────────────────────────────

  Future<void> clearAllData() async {
    _collected = [];
    _pullHistory = [];
    _isLoaded = false;
    _isLoading = false;
    _loadError = null;
    notifyListeners();
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

  @override
  void dispose() {
    _collected.clear();
    _pullHistory.clear();
    super.dispose();
  }
}