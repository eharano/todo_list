import 'package:todo_list/app/core/external/database/adapter_database.dart';
import 'package:todo_list/app/modules/todo/external/mappers/todo_mapper.dart';

import '../../../../core/helpers/errors/datasource_error.dart';
import '../../../../core/helpers/errors/failure.dart';
import '../../domain/entities/todo.dart';
import '../../infra/datasources/todo_local_datasource.dart';

class TodoLocalDatasourceImpl implements TodoLocalDatasource {
  final AdapterDatabase adapter;

  const TodoLocalDatasourceImpl({
    required this.adapter,
  });

  @override
  Future<List<Todo>> getAll({
    int? limit = 50,
    int? offset = 0,
  }) async {
    try {
      final response = await adapter.querySql(sql: 'SELECT * FROM TODO');
      return response.map((map) => TodoMapper(map: map).toEntity()).toList();
    } on Failure {
      rethrow;
    } catch (e, stackTrace) {
      throw DataSourceError(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<bool> delete({required Map<String, dynamic> map}) async {
    const String where = "id = ?";
    final List<dynamic> args = [1];

    final int result = await adapter.delete(
      where: where,
      args: args,
    );

    return result == 1;
  }

  @override
  Future<Todo> insert({required Map<String, dynamic> map}) async {
    final int id = await adapter.insert(map);

    map.addAll({'ID': id});

    return TodoMapper(map: map).toEntity();
  }

  @override
  Future<Todo> update({required Map<String, dynamic> map}) {
    // TODO: implement update
    throw UnimplementedError();

    // final int result = await adapter.update(
    //   object: object,
    //   where: where,
    //   args: args,);

    // return TodoMapper(map: map).toEntity();
  }
}
