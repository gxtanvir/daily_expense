import 'package:daily_expense/Widget/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:daily_expense/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final Function(Expense expense) onRemoveExpense;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: ((context, index) => Dismissible(
            key: ValueKey(expenses[index]),
            background: Container(
              color: Theme.of(context).colorScheme.error,
              margin: Theme.of(context).cardTheme.margin,
            ),
            onDismissed: (direction) => onRemoveExpense(
              expenses[index],
            ),
            child: ExpensesItem(
              expense: expenses[index],
            ),
          )),
    );
  }
}
