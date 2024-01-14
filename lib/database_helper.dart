import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
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
        sentence TEXT NOT NULL,
        isCompleted INTEGER DEFAULT 0
      )
    ''');

    // Print table structure to logs
    var result = await db.rawQuery('PRAGMA table_info(todoItems)');
    print('Table Structure:');
    for (var column in result) {
      print('${column['name']} ${column['type']}');
    }
  }

  Future<int> addTodoItem(String sentence) async {
    final db = await instance.database;
    return await db.insert('todoItems', {'sentence': sentence});
  }

  Future<List<Map<String, dynamic>>> getTodoItems() async {
    final db = await instance.database;
    return await db.query('todoItems');
  }

  Future<void> updateTaskStatus(int id, bool isCompleted) async {
    final db = await instance.database;
    await db.update(
      'todoItems',
      {'isCompleted': isCompleted ? 1 : 0}, // Assuming 'isCompleted' is stored as an integer (0 or 1)
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}