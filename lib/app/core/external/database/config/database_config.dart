import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConfig {
  DatabaseConfig._internal();

  static Future<Database> getInstance() async {
    var sqlTodo = "CREATE TABLE TODO ( "
        "ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, "
        "NAME TEXT NOT NULL, "
        "DESCRIPTION TEXT, "
        "STATUS TEXT, "
        "DATA TEXT, "
        "LABEL TEXT, "
        "DATE_CREATED TEXT, "
        "DATE_UPDATED TEXT, "
        "DELETED INT DEFAULT 0, "
        "DELETED_USER INTEGER, "
        "DELETED_DATE TEXT, "
        ")";

    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todolist.db');
    // Delete the database await deleteDatabase(path);

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(sqlTodo);
      },
    );

    return database;
  }
}
