import '../../domain/entities/todo.dart';

abstract class TodoRemoteDatasource {
  Future<List<Todo>> getAll({
    required Map<String, dynamic> params,
  });
}
