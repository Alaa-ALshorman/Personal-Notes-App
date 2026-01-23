import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/note_model.dart';

class DatabaseService {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'notes.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, createdAt TEXT)',
        );
      },
    );
  }

  Future<int> addNote(Note note) async {
    var dbClient = await db;
    return await dbClient.insert('notes', note.toMap());
  }

  Future<List<Note>> getNotes() async {
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient.query(
      'notes',
      orderBy: 'id DESC',
    );
    return maps.map((item) => Note.fromMap(item)).toList();
  }

  Future<int> deleteNote(int id) async {
    var dbClient = await db;
    return await dbClient.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateNote(Note note) async {
    var dbClient = await db;
    return await dbClient.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }
}
