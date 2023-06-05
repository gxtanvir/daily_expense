import 'package:flutter/material.dart';
import 'package:daily_expense/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(
      title: 'Flutter Course',
      amount: 88.99,
      date: DateTime.now(),
      category: Category.work
    ),
    Expense(
      title: 'Mini Tour',
      amount: 16.79,
      date: DateTime.now(),
      category: Category.leisure
    ),
    Expense(
      title: 'Dinner',
      amount: 12.75,
      date: DateTime.now(),
      category: Category.food
    ),
  ];

  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        children: const [
          Text('The Chart'),
          Text('Expenses Here.........'),
        ],
      ),
    );
  }
}
