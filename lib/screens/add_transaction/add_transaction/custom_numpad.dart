import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Custom numpad với hỗ trợ phép tính cơ bản (+, -, ×, ÷).
class CustomNumpad extends StatelessWidget {
  const CustomNumpad({
    super.key,
    required this.visible,
    required this.onKeyTap,
    required this.onDismiss,
  });

  final bool visible;
  final ValueChanged<String> onKeyTap;
  final VoidCallback onDismiss;

  static const _rows = [
    ['7', '8', '9', '÷'],
    ['4', '5', '6', '×'],
    ['1', '2', '3', '-'],
    ['C', '0', '000', '+'],
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      bottom: visible ? 0 : -300,
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {}, // Ngăn tap lan ra ngoài
        child: Container(
          height: 300,
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            children: [
              // Drag handle / nút đóng
              GestureDetector(
                onTap: onDismiss,
                child: Container(
                  width: 40,
                  height: 6,
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Column(
                  children: [
                    ..._rows.map(
                      (keys) => Expanded(
                        child: Row(
                          children: keys
                              .map((k) => Expanded(child: _NumpadKey(k, onKeyTap)))
                              .toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Hàng 5: = (3/4) + OK (1/4)
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(flex: 3, child: _NumpadKey('=', onKeyTap)),
                          const SizedBox(width: 8),
                          Expanded(flex: 1, child: _NumpadKey('OK', onKeyTap)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NumpadKey extends StatelessWidget {
  const _NumpadKey(this.keyValue, this.onTap);

  final String keyValue;
  final ValueChanged<String> onTap;

  Color get _bgColor {
    switch (keyValue) {
      case 'C':
        return const Color(0x22FF5252);
      case '=':
        return const Color(0x224CAF50);
      case 'OK':
        return const Color(0x226C63FF);
      default:
        if (['+', '-', '×', '÷'].contains(keyValue)) {
          return const Color(0x226C63FF);
        }
        return Colors.white.withOpacity(0.08);
    }
  }

  Widget get _content {
    TextStyle style;
    switch (keyValue) {
      case 'C':
        style = const TextStyle(
          color: Colors.white70,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        );
        break;
      case '=':
        style = const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        );
        break;
      case 'OK':
        style = const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        );
        break;
      default:
        style = TextStyle(
          color: Colors.white,
          fontSize: ['+', '-', '×', '÷'].contains(keyValue) ? 24 : 20,
          fontWeight: ['+', '-', '×', '÷'].contains(keyValue)
              ? FontWeight.w500
              : FontWeight.w500,
        );
    }
    return Text(keyValue, style: style);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: () => onTap(keyValue),
        child: Container(
          decoration: BoxDecoration(
            color: _bgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: _content),
        ),
      ),
    );
  }
}