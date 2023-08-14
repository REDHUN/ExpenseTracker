import 'package:expensetracker/models/expense.dart';
import 'package:expensetracker/models/expense_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final List<Expenses> expense = [
    Expenses(
        title: 'shoe',
        amount: 258.7,
        date: DateTime.now(),
        category: Category.travel),
    Expenses(
        title: 'shirt',
        amount: 1000.23,
        date: DateTime.now(),
        category: Category.leisure),
    Expenses(
        title: 'movie ticket',
        amount: 300.0,
        date: DateTime.now(),
        category: Category.work)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('chart'),
          Expanded(child: ExpenseList(expense: expense)),
        ],
      ),
    );
  }
}
