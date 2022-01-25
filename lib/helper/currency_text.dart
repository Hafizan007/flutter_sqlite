import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Currencytext extends StatelessWidget {
  final String text;
  final TextStyle style;

  final formatCurrency =
      NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: 'Rp ');

  Currencytext({Key? key, required this.text, required this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        (() {
          return formatCurrency.format(int.parse(text));
        }()),
        style: style);
  }
}
