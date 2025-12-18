import 'package:flutter_practice12/core/models/expense_model.dart';
import 'package:flutter_practice12/data/datasources/expenses/expense_dto.dart';
import 'package:flutter_practice12/data/datasources/expenses/expense_mapper.dart';
import 'package:uuid/uuid.dart';

class ExpensesLocalDataSource {
  final _uuid = const Uuid();
  final List<ExpenseDto> _expenses = [];

  Future<List<ExpenseModel>> getExpenses() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _expenses.map((dto) => dto.toModel()).toList();
  }

  Future<List<ExpenseModel>> getExpensesByVehicle(String vehicleId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _expenses
        .where((dto) => dto.vehicleId == vehicleId)
        .map((dto) => dto.toModel())
        .toList();
  }

  Future<void> addExpense(ExpenseModel expense) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final newExpense = ExpenseModel(
      id: _uuid.v4(),
      vehicleId: expense.vehicleId,
      title: expense.title,
      amount: expense.amount,
      date: DateTime.now(),
    );
    _expenses.add(newExpense.toDto());
  }

  Future<void> deleteExpense(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _expenses.removeWhere((dto) => dto.id == id);
  }

  Future<double> getTotalExpenses() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _expenses.fold<double>(0.0, (sum, dto) => sum + dto.amount);
  }

  Future<double> getTotalExpensesByVehicle(String vehicleId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _expenses
        .where((dto) => dto.vehicleId == vehicleId)
        .fold<double>(0.0, (sum, dto) => sum + dto.amount);
  }
}

