import 'package:dartz/dartz.dart';

import '../../../../core/helpers/errors/failure.dart';
import '../dtos/todo_paginate_dto.dart';
import '../dtos/todo_dto.dart';
import '../entities/todo.dart';

abstract class TodoUsecaseSelect {
  Future<Either<Failure, List<Todo>>> call({
    required TodoPaginateDTO params,
  });
}

abstract class TodoUsecaseInsert {
  Future<Either<Failure, Todo>> call({
    required TodoDTO todoDTO,
  });
}

abstract class TodoUsecaseUpdate {
  Future<Either<Failure, Todo>> call({
    required TodoDTO todoDTO,
  });
}

abstract class TodoUsecaseDelete {
  Future<Either<Failure, bool>> call({
    required TodoDTO todoDTO,
  });
}
