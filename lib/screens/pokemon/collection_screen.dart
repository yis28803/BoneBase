// screens/collection_screen.dart
import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../../models/pokemon_models.dart';

/// Full Collection Book screen.
/// Pass in the user's collected list and full evolution chain data.
///
/// [collected]        - list of CollectedPokemon the user owns
/// [allChains]        - all EvolutionChain objects (full dex)
/// [onPokemonTap]     - called when user taps a collected card (open detail)
class CollectionScreen extends StatefulWidget {
  final List<CollectedPokemon> collected;
  final List<EvolutionChain> allChains;
  final void Function(CollectedPokemon) onPokemonTap;

  const CollectionScreen({
    super.key,
    required this.collected,
    required this.allChains,
    required this.onPokemonTap,
  });

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  String _filter = 'All';

  static const _rarityFilters = [
    'All',
    'Common',
    'Rare',
    'Epic',
    'Mythical',
    'Legendary',
  ];

  int get _totalPossible => widget.allChains
      .expand((c) => c.stages)
      .map((s) => s.dexNumber)
      .toSet()
      .length;

  List<CollectedPokemon> get _filtered {
    if (_filter == 'All') return widget.collected;

    return widget.collected
        .where((p) => p.rarity.toLowerCase() == _filter.toLowerCase())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final pct =
        (_totalPossible > 0 ? widget.collected.length / _totalPossible : 0.0)
            .clamp(0.0, 1.0);

    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            pinned: true,
            expandedHeight: 180,
            backgroundColor: AppColors.bgDeep,
            flexibleSpace: FlexibleSpaceBar(
              background: _CollectionHeader(
                collected: widget.collected.length,
                total: _totalPossible,
                pct: pct,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(52),
              child: Column(
                children: [
                  // ── Tab bar ──────────────────────────────
                  const SizedBox(height: 8),
                  // ── Rarity filter chips ──────────────────
                  SizedBox(
                    height: 36,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: _rarityFilters.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (_, i) {
                        final f = _rarityFilters[i];
                        final isSelected = _filter == f;
                        final c = f == 'All'
                            ? AppColors.accentBlue
                            : AppColors.rarityColor(f);
                        return GestureDetector(
                          onTap: () => setState(() => _filter = f),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? c.withOpacity(0.2)
                                  : AppColors.bgSurface,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected
                                    ? c.withOpacity(0.7)
                                    : AppColors.divider,
                              ),
                            ),
                            child: Text(
                              f,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: isSelected ? c : AppColors.textMuted,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
        body: _PokemonGrid(pokemons: _filtered, onTap: widget.onPokemonTap),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
class _CollectionHeader extends StatelessWidget {
  final int collected;
  final int total;
  final double pct;

  const _CollectionHeader({
    required this.collected,
    required this.total,
    required this.pct,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0D1829), AppColors.bgDeep],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
      child: Row(
        children: [
          // Icon
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.bgElevated,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.accentBlue.withOpacity(0.4)),
            ),
            child: Center(
              child: Image.asset(
                'lib/assets/ball/ultra-ball.png',
                width: 28,
                height: 28,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Pokémon',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$collected / $total Pokémon',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: pct,
                    minHeight: 6,
                    backgroundColor: AppColors.progressBg,
                    valueColor: const AlwaysStoppedAnimation(
                      AppColors.accentBlue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '${(pct * 100).toStringAsFixed(1)}%',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.accentBlue,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
class _PokemonGrid extends StatelessWidget {
  final List<CollectedPokemon> pokemons;
  final void Function(CollectedPokemon) onTap;

  const _PokemonGrid({required this.pokemons, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (pokemons.isEmpty) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('🔮', style: TextStyle(fontSize: 48)),
            SizedBox(height: 12),
            Text(
              'No Pokémon yet!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.78,
      ),
      itemCount: pokemons.length,
      itemBuilder: (_, i) => _PokemonGridCard(
        pokemon: pokemons[i],
        onTap: () => onTap(pokemons[i]),
      ),
    );
  }
}

class _PokemonGridCard extends StatelessWidget {
  final CollectedPokemon pokemon;
  final VoidCallback onTap;

  const _PokemonGridCard({required this.pokemon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final rarityColor = AppColors.rarityColor(pokemon.rarity);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: rarityColor.withOpacity(0.3), width: 1),
          boxShadow: [
            BoxShadow(
              color: rarityColor.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Rarity stripe
            Container(
              height: 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColors.rarityGradient(pokemon.rarity),
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(14),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Image.asset(
                  pokemon.stage.spriteUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.catching_pokemon,
                    color: AppColors.textMuted,
                    size: 36,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 6, right: 6),
              child: Column(
                children: [
                  Text(
                    pokemon.stage.displayName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  if (pokemon.canEvolve)
                    const Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text(
                        '↑ Can evolve',
                        style: TextStyle(
                          fontSize: 9,
                          color: AppColors.accentBlue,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
