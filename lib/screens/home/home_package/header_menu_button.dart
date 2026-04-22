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

class _HeaderMenuButtonState extends State<HeaderMenuButton> {
  bool _isExpanded = false;

  void _toggle() {
    HapticFeedback.selectionClick();
    setState(() => _isExpanded = !_isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    // FIX: SizedBox bao ngoài phải đủ lớn để chứa cả 2 button mở rộng
    // Button chart lệch sang trái 44px, button map lệch xuống 44px
    // => cần ít nhất 88x88 để hit test hoạt động đúng
    return SizedBox(
      width: 132,
      height: 88,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ── Button THỐNG KÊ (trái) ──────────────────────────────────────
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: _isExpanded ? 44 : 88,
            top: 22,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _isExpanded ? 1.0 : 0.0,
              child: IgnorePointer(
                ignoring: !_isExpanded,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    HapticFeedback.mediumImpact();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const StatsScreen()),
                    );
                  },
                  child: const _CircleBtn(
                    color: Color(0xFF9D8EFF),
                    icon: Icons.bar_chart_rounded,
                  ),
                ),
              ),
            ),
          ),

          // ── Button BẢN ĐỒ (dưới) ────────────────────────────────────────
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: _isExpanded ? 0 : 88,
            top: 22,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _isExpanded ? 1.0 : 0.0,
              child: IgnorePointer(
                ignoring: !_isExpanded,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    HapticFeedback.mediumImpact();
                    setState(() => _isExpanded = false);
                    // final provider = Provider.of<TransactionProvider>(
                    //   context,
                    //   listen: false,
                    // );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const MapScreen()),
                    );
                  },
                  child: const _CircleBtn(
                    color: Color(0xFF9D8EFF),
                    icon: Icons.map_rounded,
                  ),
                ),
              ),
            ),
          ),

          // ── Button chính (toggle) ────────────────────────────────────────
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
                gradient: _isExpanded
                    ? const LinearGradient(
                        colors: [Color(0xFFFF638E), Color(0xFFFF9D63)],
                      )
                    : null,
                color: _isExpanded ? null : const Color(0xFF2C2C2E),
                border: Border.all(
                  color: _isExpanded ? Colors.transparent : Colors.white12,
                ),
                boxShadow: _isExpanded
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
                onTap: _toggle,
                borderRadius: BorderRadius.circular(22),
                child: AnimatedRotation(
                  turns: _isExpanded ? 0.25 : 0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Icon(
                    _isExpanded ? Icons.close_rounded : Icons.pets_rounded,
                    color: _isExpanded ? Colors.white : Colors.white54,
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleBtn extends StatelessWidget {
  const _CircleBtn({required this.color, required this.icon});
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
        border: Border.all(color: color.withOpacity(0.5), width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }
}
