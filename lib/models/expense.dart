import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter=DateFormat().add_yMd();

enum Category { food, travel, leisure, work }
final iconCategory={Category.food: Icons.lunch_dining,Category.leisure:Icons.movie,Category.travel: Icons.flight_takeoff,Category.work:Icons.work};
class Expenses {
  Expenses(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  String get formatedDate{
    return formatter.format(date);
  }
}
