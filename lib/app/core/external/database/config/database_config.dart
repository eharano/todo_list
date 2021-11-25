import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConfig {
  Future<Database> initial() async {
    var sqlTodo = "CREATE TABLE TODO ( "
        "ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, "
        "NAME TEXT NOT NULL, "
        "DESCRIPTION TEXT, "
        "STATUS TEXT, "
        "DATA TEXT, "
        "LABEL TEXT, "
        "DATE_CREATED TEXT, "
        "DATE_UPDATED TEXT ";

    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todolist.db');
    // Delete the database await deleteDatabase(path);

    // open the database
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(sqlTodo);
      },
    );

    return database;
  }
}
