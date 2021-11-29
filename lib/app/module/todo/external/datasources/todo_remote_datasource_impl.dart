import 'package:todo_list/app/core/helpers/errors/datasource_error.dart';
import 'package:todo_list/app/core/helpers/errors/failure.dart';
import 'package:todo_list/app/module/todo/domain/entities/todo.dart';
import 'package:todo_list/app/module/todo/infra/datasources/todo_remote_datasource.dart';

class TodoRemoteDatasourceImpl implements TodoRemoteDatasource {
  const TodoRemoteDatasourceImpl();

  @override
  Future<List<Todo>> getAll({
    required Map<String, dynamic> params,
  }) async {
    try {
      // final result = await

    } on Failure {
      rethrow;
    } catch (e, stackTrace) {
      throw DataSourceError(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
