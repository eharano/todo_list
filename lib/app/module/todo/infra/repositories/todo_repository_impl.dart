import 'package:todo_list/app/module/todo/domain/entities/todo.dart';
import 'package:todo_list/app/module/todo/domain/dtos/todo_paginate_dto.dart';
import 'package:todo_list/app/core/helpers/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_list/app/module/todo/domain/repositories/todo_repository.dart';
import 'package:todo_list/app/module/todo/infra/datasources/todo_remote_datasource.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDatasource datasource;

  TodoRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<Todo>>> getAll({
    required TodoPaginateDTO params,
  }) async {
    try {
      final response = await datasource.getAll(params: params.toMap());
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
