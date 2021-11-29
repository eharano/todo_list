import 'package:dartz/dartz.dart';

import '../../../../core/helpers/errors/failure.dart';
import '../repositories/todo_repository.dart';
import '../dtos/todo_dto.dart';
import '../entities/todo.dart';
import 'todo_usecase.dart';

class TodoUsecaseImpl implements TodoUsecase {
  final TodoRepository repository;

  const TodoUsecaseImpl({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Todo>>> call({
    required TodoDTO params,
  }) {
    return repository.getAll(params: params);
  }
}
