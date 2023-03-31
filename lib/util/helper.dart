import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatToIDR(dynamic amount) {
  assert(amount is num, 'amount must number!');
  final currencyFormatter = NumberFormat.currency(locale: 'id', decimalDigits: 0);
  return currencyFormatter.format(amount);
}

SnackBar generalAppSnackbar({required String message}) {
  return SnackBar(content: Text(message));
}