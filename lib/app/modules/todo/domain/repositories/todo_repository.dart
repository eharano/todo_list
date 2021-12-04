import 'package:dartz/dartz.dart';
import 'package:todo_list/app/modules/todo/domain/dtos/todo_dto.dart';

import '../../../../core/helpers/errors/failure.dart';
import '../dtos/todo_paginate_dto.dart';
import '../entities/todo.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<Todo>>> getAll({
    required TodoPaginateDTO params,
  });

  Future<Either<Failure, Todo>> insert({
    required TodoDTO todoDTO,
  });

  Future<Either<Failure, bool>> delete({
    required TodoDTO todoDTO,
  });

  Future<Either<Failure, Todo>> update({
    required TodoDTO todoDTO,
  });
}
