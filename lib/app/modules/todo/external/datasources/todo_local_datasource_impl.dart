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
  Future<bool> delete({required Map<String, dynamic> map}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Todo> insert({required Map<String, dynamic> map}) async {
    final int id = await adapter.insert(map);

    map.addAll({'id': id});

    return TodoMapper(map: map).toEntity();
  }

  @override
  Future<Todo> update({required Map<String, dynamic> map}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
