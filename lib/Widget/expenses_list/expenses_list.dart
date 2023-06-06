import 'package:daily_expense/Widget/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:daily_expense/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: ((context, index) => ExpensesItem(expense: expenses[index])),
    );
  }
}
