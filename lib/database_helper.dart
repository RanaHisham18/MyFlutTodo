import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('todo.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todoItems(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sentence TEXT NOT NULL
      )
    ''');
  }

  Future<int> addTodoItem(String sentence) async {
    final db = await instance.database;
    return await db.insert('todoItems', {'sentence': sentence});
  }

  Future<List<Map<String, dynamic>>> getTodoItems() async {
    final db = await instance.database;
    return await db.query('todoItems');
  }
}
