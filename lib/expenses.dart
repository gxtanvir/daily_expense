import 'package:daily_expense/Widget/chart/chart.dart';
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

  // OverLay Method
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  // Add Expense Method
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  // Delete Expense Method
  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpense.insert(expenseIndex, expense);
            });
          },
        ),
        content: const Text(
          'Expense Deleted',
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    Widget mainContent = ExpensesList(
      expenses: _registeredExpense,
      onRemoveExpense: _removeExpense,
    );

    if (_registeredExpense.isEmpty) {
      mainContent = const Center(
        child: Text('No Expense found! Try adding some...,'),
      );
    }
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
          Chart(expenses: _registeredExpense),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
