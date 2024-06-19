import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE alarms(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        time TEXT
      )
    ''');
  }

  Future<int> insertAlarm(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('alarms', row);
  }

  Future<List<Map<String, dynamic>>> queryAllAlarms() async {
    Database db = await database;
    return await db.query('alarms');
  }

  Future<int> updateAlarm(Map<String, dynamic> row) async {
    Database db = await database;
    int id = row['id'];
    return await db.update('alarms', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAlarm(int id) async {
    Database db = await database;
    return await db.delete('alarms', where: 'id = ?', whereArgs: [id]);
  }
}
