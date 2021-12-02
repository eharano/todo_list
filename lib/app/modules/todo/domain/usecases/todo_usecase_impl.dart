import 'package:dartz/dartz.dart';
import 'package:todo_list/app/modules/todo/domain/dtos/todo_paginate_dto.dart';

import '../../../../core/helpers/errors/failure.dart';
import '../repositories/todo_repository.dart';
import '../entities/todo.dart';
import 'todo_usecase.dart';

class TodoUsecaseImpl implements TodoUsecase {
  final TodoRepository repository;

  const TodoUsecaseImpl({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Todo>>> call({
    required TodoPaginateDTO params,
  }) {
    return repository.getAll(params: params);
  }
}
