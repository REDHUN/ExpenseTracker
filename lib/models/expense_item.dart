import 'package:flutter/material.dart';
import 'package:expensetracker/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.item});
  final Expenses item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.title,style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: 4,),
            Row(
              children: [
                Text('\$${item.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(children: [
                  Icon(iconCategory[item.category]),
                  const SizedBox(width: 6,),
                  Text(item.formatedDate)
                ],),
              ],
            )
          ],
        ),
      ),
    );
  }
}
