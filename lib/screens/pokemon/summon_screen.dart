// screens/summon_screen.dart
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/app_theme.dart';
import '../../models/pokemon_models.dart';
import '../../data/pokemon_meta_data.dart';

/// Full-screen summon modal.
/// Push this as a route or showModalBottomSheet — it handles its own animation flow:
///   1. Capsule bursts open
///   2. Card flies in (gray / unknown face)
///   3. User taps → 3D flip → Pokémon revealed
///
/// Usage:
///   Navigator.of(context).push(MaterialPageRoute(
///     builder: (_) => SummonScreen(pokemon: collectedPokemon),
///   ));
class SummonScreen extends StatefulWidget {
  final CollectedPokemon pokemon;
  final VoidCallback? onDismiss;

  const SummonScreen({super.key, required this.pokemon, this.onDismiss});

  @override
  State<SummonScreen> createState() => _SummonScreenState();
}

enum _SummonPhase { capsule, cardGray, revealed }

class _SummonScreenState extends State<SummonScreen>
    with TickerProviderStateMixin {
  _SummonPhase _phase = _SummonPhase.capsule;

  // Capsule burst
  late final AnimationController _capsuleCtrl;
  late final Animation<double> _capsuleScale;
  late final Animation<double> _capsuleOpacity;

  // Card fly-in
  late final AnimationController _cardFlyCtrl;
  late final Animation<Offset> _cardSlide;
  late final Animation<double> _cardFadeIn;

  // Card flip
  late final AnimationController _flipCtrl;
  late final Animation<double> _flipAnim;

  // Particle shimmer
  late final AnimationController _shimmerCtrl;

  bool _isFlipped = false;

  @override
  void initState() {
    super.initState();

    _capsuleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _capsuleScale = Tween<double>(
      begin: 0.4,
      end: 1.6,
    ).animate(CurvedAnimation(parent: _capsuleCtrl, curve: Curves.elasticOut));
    _capsuleOpacity = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _capsuleCtrl,
        curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
      ),
    );

    _cardFlyCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _cardSlide = Tween<Offset>(begin: const Offset(0, 0.6), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _cardFlyCtrl, curve: Curves.easeOutCubic),
        );
    _cardFadeIn = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _cardFlyCtrl, curve: Curves.easeOut));

    _flipCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _flipAnim = Tween<double>(
      begin: 0,
      end: math.pi,
    ).animate(CurvedAnimation(parent: _flipCtrl, curve: Curves.easeInOutCubic));

    _shimmerCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _startSequence();
  }

  void _startSequence() async {
    await Future.delayed(const Duration(milliseconds: 300));
    await _capsuleCtrl.forward();
    setState(() => _phase = _SummonPhase.cardGray);
    await _cardFlyCtrl.forward();
  }

  @override
  void dispose() {
    _capsuleCtrl.dispose();
    _cardFlyCtrl.dispose();
    _flipCtrl.dispose();
    _shimmerCtrl.dispose();
    super.dispose();
  }

  void _onTapCard() async {
    if (_phase != _SummonPhase.cardGray || _isFlipped) return;
    _isFlipped = true;
    HapticFeedback.mediumImpact();
    await _flipCtrl.forward();
    setState(() => _phase = _SummonPhase.revealed);
    HapticFeedback.heavyImpact();
  }

  @override
  Widget build(BuildContext context) {
    final rarity = widget.pokemon.rarity;
    final rarityColor = AppColors.rarityColor(rarity);

    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      body: Stack(
        children: [
          // ── Background glow ──────────────────────────────────
          Positioned.fill(
            child: AnimatedOpacity(
              opacity: _phase == _SummonPhase.revealed ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 800),
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 1.2,
                    colors: [rarityColor.withOpacity(0.12), AppColors.bgDeep],
                  ),
                ),
              ),
            ),
          ),

          // ── Stars / particle field ───────────────────────────
          const _ParticleField(),

          // ── Content ──────────────────────────────────────────
          SafeArea(
            child: Column(
              children: [
                // Top bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 40),
                      Text(
                        _phase == _SummonPhase.capsule
                            ? 'Opening...'
                            : _phase == _SummonPhase.cardGray
                            ? 'Tap to Reveal'
                            : widget.pokemon.stage.displayName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                          letterSpacing: 0.3,
                        ),
                      ),
                      if (_phase == _SummonPhase.revealed)
                        GestureDetector(
                          onTap:
                              widget.onDismiss ??
                              () => Navigator.of(context).pop(),
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: AppColors.bgElevated,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.close_rounded,
                              color: AppColors.textSecondary,
                              size: 18,
                            ),
                          ),
                        )
                      else
                        const SizedBox(width: 40),
                    ],
                  ),
                ),

                const Spacer(),

                // ── Phase: capsule ───────────────────────────
                if (_phase == _SummonPhase.capsule)
                  AnimatedBuilder(
                    animation: _capsuleCtrl,
                    builder: (_, __) => Opacity(
                      opacity: _capsuleOpacity.value,
                      child: Transform.scale(
                        scale: _capsuleScale.value,
                        child: const _CapsuleWidget(),
                      ),
                    ),
                  ),

                // ── Phase: card (gray or revealed) ──────────
                if (_phase != _SummonPhase.capsule)
                  SlideTransition(
                    position: _cardSlide,
                    child: FadeTransition(
                      opacity: _cardFadeIn,
                      child: GestureDetector(
                        onTap: _onTapCard,
                        child: AnimatedBuilder(
                          animation: _flipAnim,
                          builder: (_, __) {
                            final angle = _flipAnim.value;
                            final isFrontVisible = angle <= math.pi / 2;
                            return Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.001)
                                ..rotateY(angle),
                              child: isFrontVisible
                                  ? _GrayCard(
                                      pokemon: widget.pokemon,
                                      rarity: rarity,
                                      rarityColor: rarityColor,
                                      shimmer: _shimmerCtrl,
                                      hint: widget.pokemon.stage.hint,
                                    )
                                  : Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.identity()
                                        ..rotateY(math.pi),
                                      child: _RevealedCard(
                                        pokemon: widget.pokemon,
                                        rarityColor: rarityColor,
                                      ),
                                    ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                const Spacer(),

                // ── Bottom hint ──────────────────────────────
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: AnimatedOpacity(
                    opacity: _phase == _SummonPhase.cardGray ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 400),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: AppColors.accentBlue,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Tap card to reveal your Pokémon',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // ── Revealed: actions ────────────────────────
                if (_phase == _SummonPhase.revealed)
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 40,
                      left: 24,
                      right: 24,
                    ),
                    child: Column(
                      children: [
                        if (widget.pokemon.canEvolve)
                          Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.accentBlue.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.accentBlue.withOpacity(0.3),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.auto_awesome,
                                  color: AppColors.accentBlue,
                                  size: 14,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Can evolve into ${widget.pokemon.nextStage!.displayName}',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: AppColors.accentBlue,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed:
                                widget.onDismiss ??
                                () => Navigator.of(context).pop(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: rarityColor,
                              foregroundColor: Colors.black,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: const Text(
                              'Add to Collection',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Sub-widgets
// ─────────────────────────────────────────────────────────────

class _CapsuleWidget extends StatelessWidget {
  const _CapsuleWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF4A9EFF), Color(0xFF1A3A6F)],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accentBlue.withOpacity(0.5),
                  blurRadius: 30,
                  spreadRadius: 5,
                ),
              ],
            ),
          ),
          const Text('🔮', style: TextStyle(fontSize: 44)),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Gray Mystery Card (Who's That Pokémon style)
// ─────────────────────────────────────────────────────────────

class _GrayCard extends StatelessWidget {
  final CollectedPokemon pokemon;
  final String rarity;
  final Color rarityColor;
  final AnimationController shimmer;
  final String hint;

  const _GrayCard({
    required this.pokemon,
    required this.rarity,
    required this.rarityColor,
    required this.shimmer,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: shimmer,
      builder: (_, __) {
        // Floating animation
        final floatOffset =
            math.sin(shimmer.value * math.pi * 2) * 6;

        // Pulse glow animation
        final glowScale =
            1 + (math.sin(shimmer.value * math.pi * 2) * 0.05);

        return Transform.translate(
          offset: Offset(0, floatOffset),
          child: Container(
            width: 220,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1C2540),
                  Color(0xFF0F1420),
                  Color(0xFF1C2540),
                ],
              ),
              border: Border.all(
                color: rarityColor.withOpacity(0.5),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: rarityColor.withOpacity(0.28),
                  blurRadius: 28,
                  offset: const Offset(0, 10),
                ),
              ],
            ),

            child: Stack(
              children: [
                // ── Animated shimmer sweep ─────────────────
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Transform.translate(
                          offset: Offset(
                            (shimmer.value * 400) - 250,
                            0,
                          ),
                          child: Container(
                            width: 80,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.transparent,
                                  Colors.white.withOpacity(0.05),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // ── Main content ──────────────────────────
                Column(
                  children: [
                    const Spacer(),

                    // ── Silhouette area ───────────────────
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Glow pulse
                            Transform.scale(
                              scale: glowScale,
                              child: Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: rarityColor.withOpacity(0.35),
                                      blurRadius: 45,
                                      spreadRadius: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Pokémon silhouette
                            Hero(
                              // tag: 'pokemon_${pokemon.stage.id}',
                              tag: 'pokemon_${pokemon.stage.displayName}',
                              child: ColorFiltered(
                                colorFilter: const ColorFilter.mode(
                                  Colors.black,
                                  BlendMode.srcIn,
                                ),
                                child: Image.asset(
                                  pokemon.stage.spriteUrl,
                                  fit: BoxFit.contain,
                                  filterQuality: FilterQuality.high,

                                  errorBuilder: (_, __, ___) =>
                                      const Icon(
                                        Icons.catching_pokemon,
                                        color: Colors.black,
                                        size: 100,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ── Hint text ─────────────────────────
                    if (hint.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          20,
                          12,
                          20,
                          22,
                        ),
                        child: Text(
                          hint,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: rarityColor.withOpacity(0.72),
                            fontStyle: FontStyle.italic,
                            height: 1.55,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _RevealedCard extends StatelessWidget {
  final CollectedPokemon pokemon;
  final Color rarityColor;

  const _RevealedCard({required this.pokemon, required this.rarityColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.bgElevated, AppColors.bgCard],
        ),
        border: Border.all(color: rarityColor, width: 2),
        boxShadow: [
          BoxShadow(
            color: rarityColor.withOpacity(0.4),
            blurRadius: 30,
            offset: const Offset(0, 8),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          // Rarity header strip
          Container(
            height: 36,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.rarityGradient(pokemon.rarity),
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
            ),
            child: Center(
              child: Text(
                pokemon.rarity.toUpperCase(),
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          // Sprite
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                pokemon.stage.spriteUrl,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.catching_pokemon,
                  color: AppColors.textMuted,
                  size: 60,
                ),
              ),
            ),
          ),
          // Name + stage
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              children: [
                Text(
                  pokemon.stage.displayName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Stage ${pokemon.stage.stage}',
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textMuted,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ParticleField extends StatefulWidget {
  const _ParticleField();

  @override
  State<_ParticleField> createState() => _ParticleFieldState();
}

class _ParticleFieldState extends State<_ParticleField>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  final _rng = math.Random(42);
  late final List<_Particle> _particles;

  @override
  void initState() {
    super.initState();
    _particles = List.generate(
      30,
      (_) => _Particle(
        x: _rng.nextDouble(),
        y: _rng.nextDouble(),
        size: _rng.nextDouble() * 2 + 1,
        speed: _rng.nextDouble() * 0.003 + 0.001,
        opacity: _rng.nextDouble() * 0.4 + 0.1,
      ),
    );
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) => CustomPaint(
        size: Size.infinite,
        painter: _ParticlePainter(particles: _particles, progress: _ctrl.value),
      ),
    );
  }
}

class _Particle {
  final double x, y, size, speed, opacity;
  const _Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.opacity,
  });
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  final double progress;

  const _ParticlePainter({required this.particles, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      final dy = (p.y + progress * p.speed * 100) % 1.0;
      final paint = Paint()
        ..color = Colors.white.withOpacity(p.opacity)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(
        Offset(p.x * size.width, dy * size.height),
        p.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter old) =>
      old.progress != progress;
}
