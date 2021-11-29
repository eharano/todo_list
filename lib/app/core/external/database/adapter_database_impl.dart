import 'package:sqflite/sqflite.dart';
import 'package:todo_list/app/core/external/database/errors/database_error.dart';

import 'adapter_database.dart';

class AdapterDatabaseImpl implements AdapterDatabase {
  final Database database;

  AdapterDatabaseImpl({
    required this.database,
  });

  @override
  Future<int> insert(
    String table,
    Map<String, dynamic> object,
  ) {
    try {
      return database.insert(table, object);
      // } on TODO validation error
    } catch (e, stackTrace) {
      throw DatabaseError(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<int> delete(
    String table,
    String where,
    List<dynamic> args,
  ) {
    // implementar o update de invisibilidade
    // return update(table, object, where, args);
    return database.delete(table, where: where, whereArgs: args);
  }

  @override
  Future<int> update(
    String table,
    Map<String, dynamic> object,
    String where,
    List<dynamic> args,
  ) {
    return database.update(
      table,
      object,
      where: where,
      whereArgs: args,
    );
  }

  @override
  Future<List<Map<String, Object?>>> querySql(
    String sql,
    List<dynamic>? args,
  ) {
    return database.rawQuery(sql, args);
  }

  @override
  Future<List<Map<String, Object?>>> query(
    String table,
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? args,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  ) {
    return database.query(
      table,
      distinct: distinct,
      columns: columns,
      where: where,
      whereArgs: args,
      groupBy: groupBy,
      having: having,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );
  }
}
