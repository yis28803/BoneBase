import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:provider/provider.dart';
// import '../../../providers/transaction_provider.dart';

import '../../stats/stats_screen.dart';
import '../../utils/map_screen.dart';

class HeaderMenuButton extends StatefulWidget {
  const HeaderMenuButton({super.key});

  @override
  State<HeaderMenuButton> createState() => _HeaderMenuButtonState();
}

class _HeaderMenuButtonState extends State<HeaderMenuButton>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;

  void _toggleMenu() {
    HapticFeedback.selectionClick();

    setState(() {
      _expanded = !_expanded;
    });
  }

  void _openStats() {
    HapticFeedback.mediumImpact();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const StatsScreen(),
      ),
    );
  }

  void _openMap() {
    HapticFeedback.mediumImpact();

    setState(() {
      _expanded = false;
    });

    // final provider = Provider.of<TransactionProvider>(
    //   context,
    //   listen: false,
    // );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const MapScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 132,
      height: 88,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// ===== Stats Button =====
          _buildAnimatedButton(
            visible: _expanded,
            left: _expanded ? 44 : 88,
            top: 22,
            icon: Icons.bar_chart_rounded,
            color: const Color(0xFF9D8EFF),
            onTap: _openStats,
          ),

          /// ===== Map Button =====
          _buildAnimatedButton(
            visible: _expanded,
            left: _expanded ? 0 : 88,
            top: 22,
            icon: Icons.map_rounded,
            color: const Color(0xFF9D8EFF),
            onTap: _openMap,
          ),

          /// ===== Main Toggle Button =====
          Positioned(
            left: 88,
            top: 22,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: _expanded
                    ? const LinearGradient(
                        colors: [
                          Color(0xFFFF638E),
                          Color(0xFFFF9D63),
                        ],
                      )
                    : null,
                color:
                    _expanded ? null : const Color(0xFF2C2C2E),
                border: Border.all(
                  color: _expanded
                      ? Colors.transparent
                      : Colors.white12,
                ),
                boxShadow: _expanded
                    ? [
                        BoxShadow(
                          color: Colors.purple.withOpacity(0.4),
                          blurRadius: 15,
                          spreadRadius: 3,
                        ),
                      ]
                    : null,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(22),
                onTap: _toggleMenu,
                child: Center(
                  child: AnimatedRotation(
                    turns: _expanded ? 0.25 : 0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: Icon(
                      _expanded
                          ? Icons.close_rounded
                          : Icons.pets_rounded,
                      color: _expanded
                          ? Colors.white
                          : Colors.white54,
                      size: 22,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedButton({
    required bool visible,
    required double left,
    required double top,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      left: left,
      top: top,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: visible ? 1 : 0,
        child: IgnorePointer(
          ignoring: !visible,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: _CircleButton(
              color: color,
              icon: icon,
            ),
          ),
        ),
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  const _CircleButton({
    required this.color,
    required this.icon,
  });

  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF2C2C2E),
        border: Border.all(
          color: color.withOpacity(0.5),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Icon(
        icon,
        color: color,
        size: 20,
      ),
    );
  }
}