import 'package:sqflite/sqflite.dart';
import 'package:todo_list/app/core/external/database/errors/database_error.dart';

import 'adapter_database.dart';

class AdapterDatabaseImpl implements AdapterDatabase {
  final Database database;

  @override
  final String table;

  var time = (DateTime.now()).toString();
  // var time = (DateTime.now().microsecondsSinceEpoch).toString();

  AdapterDatabaseImpl({
    required this.database,
    required this.table,
  });

  @override
  Future<int> insert(
    Map<String, dynamic> object,
  ) {
    try {
      object['DATECREATED'] = time;
      return database.insert(table, object);
    } catch (e, stackTrace) {
      throw DatabaseError(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<int> delete({
    required String where,
    required List<dynamic> args,
  }) {
    try {
      // essa ação marca apenas os registros como excluídos
      var columnsDeleted = {
        "DELETED": 1,
        "DATEDELETED": time,
      };

      return update(
        object: columnsDeleted,
        where: where,
        args: args,
      );
    } catch (e, stackTrace) {
      throw DatabaseError(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<int> update({
    required Map<String, dynamic> object,
    required String where,
    required List<dynamic> args,
  }) {
    try {
      object['DATEUPDATED'] = time;

      return database.update(
        table,
        object,
        where: where,
        whereArgs: args,
      );
    } catch (e, stackTrace) {
      throw DatabaseError(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<List<Map<String, Object?>>> querySql({
    required String sql,
    List<dynamic>? args,
  }) {
    try {
      return database.rawQuery(sql, args);
    } catch (e, stackTrace) {
      throw DatabaseError(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<List<Map<String, Object?>>> query({
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? args,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) {
    try {
      where = (where != null ? "$where AND " : "") + " DELETED = 0";
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
    } catch (e, stackTrace) {
      throw DatabaseError(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
