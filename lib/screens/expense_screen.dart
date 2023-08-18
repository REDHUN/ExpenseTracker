import 'package:expensetracker/models/expense.dart';
import 'package:expensetracker/models/expense_list.dart';
import 'package:expensetracker/screens/new_expense.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final List<Expenses> _expense = [
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

  void _openaddexpenseOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: _addExpense,
            ));
  }

  void _addExpense(Expenses expense) {
    setState(() {
      _expense.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _openaddexpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
        title: const Text('Expense Tracker'),
      ),
      body: Column(
        children: [
          const Text('chart'),
          Expanded(child: ExpenseList(expense: _expense)),
        ],
      ),
    );
  }
}
