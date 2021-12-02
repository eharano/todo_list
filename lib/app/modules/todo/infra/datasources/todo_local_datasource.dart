import '../../domain/entities/todo.dart';

abstract class TodoLocalDatasource {
  Future<List<Todo>> getAll({
    int? limit = 50,
    int? offset = 0,
  });

  Future<Todo> insert({
    required Map<String, dynamic> map,
  });

  Future<Todo> update({
    required Map<String, dynamic> map,
  });

  Future<bool> delete({
    required Map<String, dynamic> map,
  });
}
