import 'package:flutter/foundation.dart';

@immutable
class TransactionModel {
  final String title;
  final double price;
  final DateTime date;

  const TransactionModel({
    required this.title,
    required this.price,
    required this.date,
  });
}
