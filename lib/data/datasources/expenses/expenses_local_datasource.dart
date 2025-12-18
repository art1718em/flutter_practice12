import 'package:flutter_practice12/core/models/expense_model.dart';
import 'package:flutter_practice12/core/storage/database_helper.dart';
import 'package:flutter_practice12/data/datasources/expenses/expense_dto.dart';
import 'package:flutter_practice12/data/datasources/expenses/expense_mapper.dart';
import 'package:uuid/uuid.dart';

class ExpensesLocalDataSource {
  final _uuid = const Uuid();
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  Future<List<ExpenseModel>> getExpenses() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'expenses',
      orderBy: 'date DESC',
    );

    return maps.map((map) => ExpenseDto.fromJson(map).toModel()).toList();
  }

  Future<List<ExpenseModel>> getExpensesByVehicle(String vehicleId) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'expenses',
      where: 'vehicleId = ?',
      whereArgs: [vehicleId],
      orderBy: 'date DESC',
    );

    return maps.map((map) => ExpenseDto.fromJson(map).toModel()).toList();
  }

  Future<void> addExpense(ExpenseModel expense) async {
    final db = await _dbHelper.database;
    final newExpense = ExpenseModel(
      id: _uuid.v4(),
      vehicleId: expense.vehicleId,
      title: expense.title,
      amount: expense.amount,
      date: DateTime.now(),
    );

    await db.insert('expenses', newExpense.toDto().toJson());
  }

  Future<void> deleteExpense(String id) async {
    final db = await _dbHelper.database;
    await db.delete(
      'expenses',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<double> getTotalExpenses() async {
    final db = await _dbHelper.database;
    final result = await db.rawQuery('SELECT SUM(amount) as total FROM expenses');
    final total = result.first['total'];
    return total != null ? (total as num).toDouble() : 0.0;
  }

  Future<double> getTotalExpensesByVehicle(String vehicleId) async {
    final db = await _dbHelper.database;
    final result = await db.rawQuery(
      'SELECT SUM(amount) as total FROM expenses WHERE vehicleId = ?',
      [vehicleId],
    );
    final total = result.first['total'];
    return total != null ? (total as num).toDouble() : 0.0;
  }
}

