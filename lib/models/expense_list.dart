import 'package:expensetracker/models/expense.dart';
import 'package:expensetracker/models/expense_item.dart';

import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expense, required this.removeExpense});
  final List<Expenses> expense;
  final void Function(Expenses expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: ((context, index) => Dismissible(
        background: Container(color: Theme.of(context).colorScheme.error,margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),),
            key: ValueKey(expense[index]),
            child: ExpenseItem(item: expense[index]),
            onDismissed: (direction) {
              removeExpense(expense[index]);
            },
          )),
    );
  }
}
