import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/app/core/external/database/errors/database_error.dart';

class DatabaseConfig {
  DatabaseConfig._internal();

  static Future<Database> getInstance() async {
    var sqlTodo = "CREATE TABLE TODO ( "
        "ID INTEGER PRIMARY KEY AUTOINCREMENT, "
        "NAME TEXT NOT NULL, "
        "DESCRIPTION TEXT, "
        "STATUS TEXT, "
        "DATA TEXT, "
        "LABEL TEXT, "
        "DATECREATED TEXT, "
        "DATEUPDATED TEXT, "
        "DATEDELETED TEXT, "
        "DELETED_USER INTEGER, "
        "DELETED INTEGER DEFAULT 0 "
        ")";

    try {
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
    } on DatabaseException catch (e, stackTrace) {
      throw DatabaseError(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    } catch (e, stackTrace) {
      throw DatabaseError(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
