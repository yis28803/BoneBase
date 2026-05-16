// lib/features/pokemon/models/pokemon_models.dart

class PokemonStage {
  final String name;
  final int dexNumber;
  final int stage; // 1 = base, 2 = first evo, 3 = final evo

  const PokemonStage({
    required this.name,
    required this.dexNumber,
    required this.stage,
  });

  String get spriteUrl => 'lib/assets/pokemon/$dexNumber.png';

  String get displayName {
    final n = name.replaceAll('-', ' ');
    return n[0].toUpperCase() + n.substring(1);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dex_number': dexNumber,
      'stage': stage,
    };
  }

  factory PokemonStage.fromMap(Map<String, dynamic> map) {
    return PokemonStage(
      name: map['name'] as String,
      dexNumber: map['dex_number'] as int,
      stage: map['stage'] as int,
    );
  }
}

// ===============================
// EVOLUTION CHAIN
// ===============================

class EvolutionChain {
  final List<PokemonStage> stages;

  const EvolutionChain({required this.stages});

  bool get hasEvolution => stages.length > 1;

  PokemonStage get base => stages.first;

  PokemonStage? nextEvolution(int currentDex) {
    final idx = stages.indexWhere((s) => s.dexNumber == currentDex);
    if (idx == -1 || idx >= stages.length - 1) return null;
    return stages[idx + 1];
  }

  bool isMaxEvolution(int dexNumber) {
    return stages.last.dexNumber == dexNumber;
  }
}

// ===============================
// COLLECTED POKEMON
// ===============================

class CollectedPokemon {
  // ✅ id dùng làm PRIMARY KEY trong SQLite (UUID khi tạo)
  final String id;
  final PokemonStage stage;
  final EvolutionChain chain;
  final DateTime obtainedAt;

  /// common / rare / epic / legendary / mythical
  final String rarity;

  final bool isRevealed;

  const CollectedPokemon({
    required this.id,
    required this.stage,
    required this.chain,
    required this.obtainedAt,
    required this.rarity,
    this.isRevealed = false,
  });

  CollectedPokemon copyWith({bool? isRevealed}) {
    return CollectedPokemon(
      id: id,
      stage: stage,
      chain: chain,
      obtainedAt: obtainedAt,
      rarity: rarity,
      isRevealed: isRevealed ?? this.isRevealed,
    );
  }

  bool get canEvolve => !chain.isMaxEvolution(stage.dexNumber);

  PokemonStage? get nextStage => chain.nextEvolution(stage.dexNumber);

  String get financialInsight {
    final insights = {
      'mythical': '🌌 Một điều cực hiếm vừa xảy ra!',
      'legendary': '✨ Chi tiêu của bạn giảm 30% tháng này!',
      'epic': '🔥 Bạn đã tiết kiệm được 2.4M VNĐ tuần qua',
      'rare': '⚡ 42% chi tiêu của bạn là ăn uống',
      'common': '📊 Bạn thường chi tiêu vào cuối tuần',
    };
    return insights[rarity] ?? '📦 Không có dữ liệu';
  }

  // ✅ Chỉ lưu dex_number — chain được reconstruct khi load (lookup từ kAllEvolutionChains)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dex_number': stage.dexNumber,
      'rarity': rarity,
      'is_revealed': isRevealed ? 1 : 0,
      'obtained_at': obtainedAt.toIso8601String(),
    };
  }

  // ✅ fromMap nhận stage + chain từ ngoài (PokemonProvider lookup từ kAllEvolutionChains)
  static CollectedPokemon fromMap(
    Map<String, dynamic> map,
    PokemonStage stage,
    EvolutionChain chain,
  ) {
    return CollectedPokemon(
      id: map['id'] as String,
      stage: stage,
      chain: chain,
      rarity: map['rarity'] as String,
      isRevealed: (map['is_revealed'] as int) == 1,
      obtainedAt: DateTime.parse(map['obtained_at'] as String),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CollectedPokemon &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'CollectedPokemon(id: $id, dex: ${stage.dexNumber}, rarity: $rarity)';
}

// ===============================
// SUMMON HISTORY
// ===============================

class SummonRecord {
  // ✅ id dùng làm PRIMARY KEY trong SQLite
  final String id;
  final CollectedPokemon pokemon;
  final DateTime pulledAt;

  const SummonRecord({
    required this.id,
    required this.pokemon,
    required this.pulledAt,
  });

  // ✅ Chỉ lưu pokemon_id — join khi load
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pokemon_id': pokemon.id,
      'pulled_at': pulledAt.toIso8601String(),
    };
  }
}

// ===============================
// POKEMON META
// ===============================

class PokemonMeta {
  final String hint;
  final String lore;

  /// common / rare / epic / legendary / mythical
  final String rarity;

  const PokemonMeta({
    required this.hint,
    required this.lore,
    required this.rarity,
  });
}