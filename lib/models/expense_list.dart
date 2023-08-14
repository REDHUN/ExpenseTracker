import 'package:expensetracker/models/expense.dart';
import 'package:expensetracker/models/expense_item.dart';

import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expense});
  final List<Expenses> expense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: ((context, index) => ExpenseItem(item: expense[index])),
    );
  }
}
