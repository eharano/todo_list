import 'package:dartz/dartz.dart';
import 'package:todo_list/app/modules/todo/domain/dtos/todo_dto.dart';
import 'package:todo_list/app/modules/todo/domain/dtos/todo_paginate_dto.dart';

import '../../../../core/helpers/errors/failure.dart';
import '../repositories/todo_repository.dart';
import '../entities/todo.dart';
import 'todo_usecase.dart';

class TodoUsecaseSelectImpl implements TodoUsecaseSelect {
  final TodoRepository repository;

  const TodoUsecaseSelectImpl({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Todo>>> call({
    required TodoPaginateDTO params,
  }) {
    return repository.getAll(params: params);
  }
}

class TodoUsecaseInsertImpl implements TodoUsecaseInsert {
  final TodoRepository repository;

  const TodoUsecaseInsertImpl({
    required this.repository,
  });

  @override
  Future<Either<Failure, Todo>> call({
    required TodoDTO todoDTO,
  }) {
    return repository.insert(todoDTO: todoDTO);
  }
}

class TodoUsecaseDeleteImpl implements TodoUsecaseDelete {
  final TodoRepository repository;

  const TodoUsecaseDeleteImpl({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> call({
    required TodoDTO todoDTO,
  }) {
    return repository.delete(todoDTO: todoDTO);
  }
}

class TodoUsecaseUpdateImpl implements TodoUsecaseUpdate {
  final TodoRepository repository;

  const TodoUsecaseUpdateImpl({
    required this.repository,
  });

  @override
  Future<Either<Failure, Todo>> call({
    required TodoDTO todoDTO,
  }) {
    return repository.update(todoDTO: todoDTO);
  }
}
