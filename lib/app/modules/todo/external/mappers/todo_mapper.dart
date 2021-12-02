import '../../domain/entities/todo.dart';
import '../helpers/errors/todo_mapper_error.dart';

class TodoMapper {
  final Map<String, dynamic> map;

  TodoMapper({
    required this.map,
  });

  Todo toEntity() {
    try {
      return Todo(
        id: map['id'],
        title: map['title'],
        status: map['status'],
        data: map['data'],
        label: map['label'],
      );
    } catch (e, stackTrace) {
      throw TodoMapperError(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  static Map<String, dynamic> toMap({
    required Todo todo,
  }) {
    try {
      return {
        if (todo.id != null) 'id': todo.id,
        'title': todo.title,
        'status': todo.status,
        'data': todo.data,
        'label': todo.label,
      };
    } catch (e, stackTrace) {
      throw TodoMapperError(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
