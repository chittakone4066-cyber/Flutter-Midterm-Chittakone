import 'dart:io';
import 'package:flutter_midterm/models/transaction.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DatabaseService {
  final String dbName;
  Database? _database;
  final _store = intMapStoreFactory.store("transaction_store");

  DatabaseService({required this.dbName});

  Future<Database> openDatabase() async {
    if (_database != null) {
      return _database!;
    }
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(appDirectory.path, dbName);
    DatabaseFactory dbFactory = databaseFactoryIo;
    _database = await dbFactory.openDatabase(dbPath);
    return _database!;
  }

  Future<int> insertData(TransactionModel statement) async {
    final db = _database!;
    final keyId = await _store.add(db, {
      "title": statement.title,
      "price": statement.price,
      "date": statement.date.toIso8601String(),
    });

    return keyId;
  }

  Future<List<TransactionModel>> loadAllTransactions() async {
    final db = _database!;
    final snapshots = await _store.find(
      db,
      finder: Finder(sortOrders: [SortOrder(Field.key, false)]),
    );
    return snapshots.map((record) {
      return TransactionModel(
        title: record["title"] as String,
        price: record["price"] as double,
        date: DateTime.parse(record["date"] as String),
      );
    }).toList();
  }

  Future<void> deleteAllData() async {
    final db = _database!;
    await _store.drop(db);
  }
}
