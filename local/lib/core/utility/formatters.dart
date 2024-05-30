import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}


 final currencyFormatter = NumberFormat.currency(locale: 'en_IN', symbol: '₹');