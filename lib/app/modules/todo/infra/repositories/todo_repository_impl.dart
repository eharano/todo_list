import 'package:dartz/dartz.dart';

import '../../../../core/helpers/errors/failure.dart';
import '../../domain/dtos/todo_dto.dart';
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

  @override
  Future<Either<Failure, Todo>> insert({
    required TodoDTO todoDTO,
  }) async {
    try {
      var response = await datasource.insert(map: todoDTO.toMap());
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, Todo>> update({
    required TodoDTO todoDTO,
  }) async {
    try {
      var response = await datasource.update(map: todoDTO.toMap());
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, bool>> delete({
    required TodoDTO todoDTO,
  }) async {
    try {
      var response = await datasource.delete(map: todoDTO.toMap());
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
