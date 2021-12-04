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
        id: map['ID'],
        title: map['NAME'],
        status: map['STATUS'],
        data: map['DATA'],
        label: map['LABEL'],
        description: map['DESCRIPTION'],
      );
    } catch (e, stackTrace) {
      throw TodoMapperError(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
