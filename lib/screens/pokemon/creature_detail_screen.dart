// screens/creature_detail_screen.dart
import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../../models/pokemon_models.dart';
import '../../data/pokemon_meta_data.dart';

/// Detail page for a single collected Pokémon.
/// Shows: full art, rarity, evolution tree, financial insight, history.
class CreatureDetailScreen extends StatefulWidget {
  final CollectedPokemon pokemon;
  final List<SummonRecord> pullHistory;
  /// Called when user can/wants to evolve (navigation to next summon opportunity)
  final VoidCallback? onEvolveHint;

  const CreatureDetailScreen({
    super.key,
    required this.pokemon,
    this.pullHistory = const [],
    this.onEvolveHint,
  });

  @override
  State<CreatureDetailScreen> createState() => _CreatureDetailScreenState();
}

class _CreatureDetailScreenState extends State<CreatureDetailScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _entryCtrl;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _entryCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _fadeAnim = CurvedAnimation(parent: _entryCtrl, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
            begin: const Offset(0, 0.08), end: Offset.zero)
        .animate(CurvedAnimation(parent: _entryCtrl, curve: Curves.easeOut));
    _entryCtrl.forward();
  }

  @override
  void dispose() {
    _entryCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.pokemon;
    final rarityColor = AppColors.rarityColor(p.rarity);
    // final gradientColors = AppColors.rarityGradient(p.rarity);

    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      body: FadeTransition(
        opacity: _fadeAnim,
        child: SlideTransition(
          position: _slideAnim,
          child: CustomScrollView(
            slivers: [
              // ── Hero header ─────────────────────────────────────
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                backgroundColor: AppColors.bgDeep,
                leading: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.bgElevated.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.arrow_back_ios_new_rounded,
                        color: AppColors.textPrimary, size: 18),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Gradient bg
                      Container(
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            center: Alignment.topCenter,
                            radius: 1.0,
                            colors: [
                              rarityColor.withOpacity(0.18),
                              AppColors.bgDeep,
                            ],
                          ),
                        ),
                      ),
                      // Pokémon art
                      Positioned(
                        top: 60,
                        left: 0,
                        right: 0,
                        bottom: 20,
                        child: Hero(
                          tag: 'pokemon_${p.stage.dexNumber}',
                          child: Image.asset(
                            p.stage.spriteUrl,
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) => const Icon(
                              Icons.catching_pokemon,
                              color: AppColors.textMuted,
                              size: 80,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // ── Name + dex ───────────────────────────────
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                p.stage.displayName,
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.textPrimary,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Stage ${p.stage.stage}  •  #${p.stage.dexNumber.toString().padLeft(4, '0')}',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.textMuted,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          _formatDate(p.obtainedAt),
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // ── Financial Insight ────────────────────────
                    _InsightCard(insight: p.financialInsight, color: rarityColor),

                    const SizedBox(height: 16),

                    // ── Pokémon Lore ─────────────────────────────
                    if (p.stage.lore.isNotEmpty)
                      _LoreCard(
                        lore: p.stage.lore,
                        pokemonName: p.stage.displayName,
                        color: rarityColor,
                      ),

                    if (p.stage.lore.isNotEmpty) const SizedBox(height: 16),

                    // ── Evolution Tree ───────────────────────────
                    _EvolutionSection(pokemon: p, rarityColor: rarityColor),

                    if (p.canEvolve && widget.onEvolveHint != null) ...[
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: widget.onEvolveHint,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 13),
                          decoration: BoxDecoration(
                            color: AppColors.accentBlue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: AppColors.accentBlue.withOpacity(0.35),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Text('⚡',
                                  style: TextStyle(fontSize: 16)),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  '${p.stage.displayName} can evolve into ${p.nextStage!.displayName}. Keep recording transactions!',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: AppColors.accentBlue,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                              const Icon(Icons.chevron_right_rounded,
                                  color: AppColors.accentBlue, size: 18),
                            ],
                          ),
                        ),
                      ),
                    ],

                    const SizedBox(height: 16),

                    // ── Pull History ─────────────────────────────
                    
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime dt) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
  }
}

// ─────────────────────────────────────────────────────────────
class _InsightCard extends StatelessWidget {
  final String insight;
  final Color color;

  const _InsightCard({required this.insight, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.insights_rounded, color: color, size: 16),
              ),
              const SizedBox(width: 10),
              const Text(
                'Financial Insight',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Sau khi add vào dự án sẽ xử lý sau',
            style: TextStyle(
              fontSize: 15,
              color: AppColors.textPrimary,
              height: 1.5,
            ),
          ),
          // Text(
          //   insight,
          //   style: const TextStyle(
          //     fontSize: 15,
          //     color: AppColors.textPrimary,
          //     height: 1.5,
          //   ),
          // ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
class _LoreCard extends StatefulWidget {
  final String lore;
  final String pokemonName;
  final Color color;

  const _LoreCard({
    required this.lore,
    required this.pokemonName,
    required this.color,
  });

  @override
  State<_LoreCard> createState() => _LoreCardState();
}

class _LoreCardState extends State<_LoreCard>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late final AnimationController _ctrl;
  // late final Animation<double> _expandAnim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    // _expandAnim =
    //     CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _expanded = !_expanded);
    _expanded ? _ctrl.forward() : _ctrl.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _expanded
                ? widget.color.withOpacity(0.4)
                : AppColors.divider,
          ),
          boxShadow: _expanded
              ? [
                  BoxShadow(
                    color: widget.color.withOpacity(0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  )
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header row ─────────────────────────────────
            Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: widget.color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.auto_stories_rounded,
                    color: widget.color,
                    size: 15,
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Pokémon Lore',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                AnimatedRotation(
                  turns: _expanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: _expanded
                        ? widget.color
                        : AppColors.textMuted,
                    size: 20,
                  ),
                ),
              ],
            ),

            // ── Collapsed preview ───────────────────────────
            if (!_expanded) ...[
              const SizedBox(height: 10),
              Text(
                widget.lore,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textMuted,
                  height: 1.5,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Tap to read more...',
                style: TextStyle(
                  fontSize: 11,
                  color: widget.color.withOpacity(0.8),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],

            // ── Expanded full lore ──────────────────────────
            if (_expanded) ...[
              const SizedBox(height: 14),
              // Decorative divider
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 1,
                    color: widget.color.withOpacity(0.4),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      widget.pokemonName,
                      style: TextStyle(
                        fontSize: 10,
                        color: widget.color.withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: widget.color.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(
                widget.lore,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textPrimary,
                  height: 1.7,
                  letterSpacing: 0.1,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
class _EvolutionSection extends StatelessWidget {
  final CollectedPokemon pokemon;
  final Color rarityColor;

  const _EvolutionSection(
      {required this.pokemon, required this.rarityColor});

  @override
  Widget build(BuildContext context) {
    final chain = pokemon.chain;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Evolution Line',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          if (!chain.hasEvolution)
            const Center(
              child: Text(
                'This Pokémon does not evolve',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textMuted,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < chain.stages.length; i++) ...[
                  _EvoNode(
                    stage: chain.stages[i],
                    isActive:
                        chain.stages[i].dexNumber == pokemon.stage.dexNumber,
                    isUnlocked: i <= chain.stages
                        .indexWhere((s) =>
                            s.dexNumber == pokemon.stage.dexNumber),
                    rarityColor: rarityColor,
                  ),
                  if (i < chain.stages.length - 1)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: AppColors.textMuted,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                ],
              ],
            ),
        ],
      ),
    );
  }
}

class _EvoNode extends StatelessWidget {
  final PokemonStage stage;
  final bool isActive;
  final bool isUnlocked;
  final Color rarityColor;

  const _EvoNode({
    required this.stage,
    required this.isActive,
    required this.isUnlocked,
    required this.rarityColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: isActive
                ? rarityColor.withOpacity(0.15)
                : AppColors.bgElevated,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isActive
                  ? rarityColor
                  : isUnlocked
                      ? AppColors.accentBlue.withOpacity(0.4)
                      : AppColors.divider,
              width: isActive ? 2 : 1,
            ),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: rarityColor.withOpacity(0.3),
                      blurRadius: 12,
                    )
                  ]
                : null,
          ),
          child: isUnlocked
              ? Image.asset(
                  stage.spriteUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.catching_pokemon,
                    color: AppColors.textMuted,
                    size: 30,
                  ),
                )
              : const Icon(Icons.lock_rounded,
                  color: AppColors.textMuted, size: 24),
        ),
        const SizedBox(height: 6),
        Text(
          isUnlocked ? stage.displayName : '???',
          style: TextStyle(
            fontSize: 10,
            fontWeight:
                isActive ? FontWeight.w700 : FontWeight.w400,
            color: isActive
                ? rarityColor
                : AppColors.textMuted,
          ),
        ),
        if (isActive)
          Container(
            margin: const EdgeInsets.only(top: 3),
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              color: rarityColor,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}
