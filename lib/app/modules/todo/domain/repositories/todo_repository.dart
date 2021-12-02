import 'package:dartz/dartz.dart';

import '../../../../core/helpers/errors/failure.dart';
import '../dtos/todo_paginate_dto.dart';
import '../entities/todo.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<Todo>>> getAll({
    required TodoPaginateDTO params,
  });
}
