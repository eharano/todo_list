import 'package:todo_list/app/core/helpers/errors/errors.dart';

class TodoMapperError extends DataSourceError {
  TodoMapperError({
    required String message,
    required StackTrace stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );

  @override
  String toString() {
    return "ToDoMapperError: $message";
  }
}
