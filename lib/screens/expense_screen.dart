import 'package:expensetracker/models/expense.dart';
import 'package:expensetracker/models/expense_list.dart';
import 'package:expensetracker/screens/new_expense.dart';
import 'package:expensetracker/widgets/charts/chart.dart';
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
        category: Category.work),
    Expenses(
        title: 'flight ticket',
        amount: 1000.23,
        date: DateTime.now(),
        category: Category.travel),
    Expenses(
        title: 'movie ticket',
        amount: 300.0,
        date: DateTime.now(),
        category: Category.leisure)
  ];

  void _openaddexpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
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

  void _removeExpense(Expenses expense) {
    final expenseIndex = _expense.indexOf(expense);
    setState(() {
      _expense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Expense Deleted.'),
      action: SnackBarAction(
        label: 'undo',
        onPressed: () {
          setState(() {
            _expense.insert(expenseIndex, expense);
          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text('No expenses found.Start adding some!'),
    );
    if (_expense.isNotEmpty) {
      mainContent = ExpenseList(
        expense: _expense,
        removeExpense: _removeExpense,
      );
    }
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
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _expense),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _expense)),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
