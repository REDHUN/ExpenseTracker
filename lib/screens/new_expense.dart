import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var _enteredTitle= '';
  void _saveTitle(String title){
     _enteredTitle=title;
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(padding: const EdgeInsets.all(16),
    child: Column(children: [
      TextField(
        onChanged: _saveTitle,
        maxLength: 50,
        decoration:const  InputDecoration(
          label: Text('title'),
        ),
      ),
      Row(children: [
        ElevatedButton(onPressed:(){ print(_enteredTitle);}, child: const Text('save'))
      ],)
    ],),
    );
  }
}