import 'package:flutter/foundation.dart';
import 'package:flutter_midterm/database/transaction_db.dart';
import 'package:flutter_midterm/models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<TransactionModel> _transactions = [];
  final DatabaseService _dbService = DatabaseService(dbName: "my_app_db.db");

  List<TransactionModel> get transactions => _transactions;
  Future<void> initData() async {
    await _dbService.openDatabase();
    _transactions = await _dbService.loadAllTransactions();
    notifyListeners();
  }

  Future<void> addTransaction(TransactionModel statement) async {
    await _dbService.insertData(statement);
    _transactions.insert(0, statement);
    notifyListeners();
  }

  Future<void> clearAllTransactions() async {
    await _dbService.deleteAllData();
    _transactions = [];
    notifyListeners();
  }
}
