import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

/// Mixin xử lý logic bàn phím số và phép tính.
/// State dùng mixin này cần có [TextEditingController] tên [amountController].
mixin CalculatorMixin<T extends StatefulWidget> on State<T> {
  final formatter = NumberFormat('#,###', 'vi_VN');

  String currentOperation = '';
  String firstNumber = '';

  /// Gọi khi người dùng nhấn phím trên numpad.
  /// Trả về `true` nếu đây là lệnh đóng numpad (OK).
  bool handleNumpadKey(
    String value,
    TextEditingController amountController, {
    required VoidCallback onDismissNumpad,
  }) {
    HapticFeedback.selectionClick();

    if (value == 'OK') {
      onDismissNumpad();
      return true;
    }

    final currentText = amountController.text.replaceAll('.', '');

    if (value == 'C') {
      amountController.text = '0';
      currentOperation = '';
      firstNumber = '';
      return false;
    }

    if (['+', '-', '×', '÷'].contains(value)) {
      firstNumber = currentText;
      currentOperation = value;
      amountController.text = '0';
      return false;
    }

    if (value == '=') {
      if (currentOperation.isNotEmpty && firstNumber.isNotEmpty) {
        final num1 = double.tryParse(firstNumber) ?? 0;
        final num2 = double.tryParse(currentText) ?? 0;
        double result;
        switch (currentOperation) {
          case '+':
            result = num1 + num2;
          case '-':
            result = num1 - num2;
          case '×':
            result = num1 * num2;
          case '÷':
            result = num2 != 0 ? num1 / num2 : 0;
          default:
            result = 0;
        }
        setAmount(result.toStringAsFixed(0), amountController);
        currentOperation = '';
        firstNumber = '';
      }
      return false;
    }

    if (value == 'backspace') {
      if (currentText.isNotEmpty && currentText != '0') {
        final newValue = currentText.substring(0, currentText.length - 1);
        setAmount(newValue.isEmpty ? '0' : newValue, amountController);
      }
      return false;
    }

    if (value == '000') {
      final newValue =
          currentText == '0' ? '000' : currentText + '000';
      setAmount(newValue, amountController);
      return false;
    }

    // Số bình thường
    final newValue = currentText == '0' ? value : currentText + value;
    setAmount(newValue, amountController);
    return false;
  }

  void setAmount(String raw, TextEditingController amountController) {
    final cleaned = raw.replaceAll('.', '');
    if (cleaned.isEmpty) {
      amountController.text = '0';
      return;
    }
    final number = int.tryParse(cleaned);
    if (number == null) return;
    final formatted = formatter.format(number);
    amountController.value = TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}