import 'package:daily_expense/Widget/expenses_list/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:daily_expense/models/expense.dart';
import 'package:daily_expense/Widget/expenses_list/expenses_list.dart';

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
        category: Category.work),
    Expense(
        title: 'Mini Tour',
        amount: 16.79,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'Dinner',
        amount: 12.75,
        date: DateTime.now(),
        category: Category.food),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) =>  NewExpense(onAddExpense: _addExpense,),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expence Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpense),
          ),
        ],
      ),
    );
  }
}
