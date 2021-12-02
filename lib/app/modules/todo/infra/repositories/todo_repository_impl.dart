import 'package:dartz/dartz.dart';
import 'package:todo_list/app/modules/todo/external/mappers/todo_mapper.dart';

import '../../../../core/helpers/errors/failure.dart';
import '../../domain/dtos/todo_paginate_dto.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_local_datasource.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDatasource datasource;

  TodoRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<Todo>>> getAll({
    required TodoPaginateDTO params,
  }) async {
    try {
      final response = await datasource.getAll(
        limit: params.limit,
        offset: params.offset,
      );
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  Future<Either<Failure, Todo>> insert({
    required Todo todo,
  }) async {
    try {
      Map<String, dynamic> todoMap = TodoMapper.toMap(todo: todo);
      var response = await datasource.insert(map: todoMap);
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  Future<Either<Failure, Todo>> update({
    required Todo todo,
  }) async {
    try {
      var response = await datasource.update(
        map: TodoMapper.toMap(todo: todo),
      );
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  Future<Either<Failure, bool>> delete({
    required Todo todo,
  }) async {
    try {
      var response = await datasource.delete(
        map: TodoMapper.toMap(todo: todo),
      );
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
