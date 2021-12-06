import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list/app/modules/todo/domain/dtos/todo_dto.dart';

import '../../domain/dtos/todo_paginate_dto.dart';
import '../../domain/usecases/todo_usecase.dart';
import '../../domain/entities/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoUsecaseSelect select;
  final TodoUsecaseInsert insert;
  final TodoUsecaseUpdate update;
  final TodoUsecaseDelete delete;

  TodoBloc({
    required this.select,
    required this.insert,
    required this.update,
    required this.delete,
  }) : super(const TodoSuccessState(todos: [])) {
    on<TodoFetchEvent>((event, emit) async {
      emit(const TodoLoadingState());

      final response = await select.call(params: event.params);
      emit(
        response.fold(
          (left) => TodoErrorState(error: left.message),
          (right) => TodoSuccessState(todos: right),
        ),
      );
    });

    on<TodoInsertEvent>((event, emit) async {
      final todos = (state as TodoSuccessState).todos;
      emit(const TodoLoadingState());

      final response = await insert.call(todoDTO: event.todo);
      emit(
        response.fold(
          (left) => TodoErrorState(error: left.message),
          (right) => TodoSuccessState(todos: (todos..add(right))),
        ),
      );
    });

    on<TodoUpdateEvent>((event, emit) async {
      final List<Todo> todos = (state as TodoSuccessState).todos;
      emit(const TodoLoadingState());

      final response = await update.call(todoDTO: event.todo);
      emit(
        response.fold(
          (left) => TodoErrorState(error: left.message),
          (right) {
            todos.removeWhere((item) => item.id == right.id);
            todos.add(right);
            return TodoSuccessState(todos: todos);
          },
        ),
      );
    });

    on<TodoDeleteEvent>((event, emit) async {
      final List<Todo> todos = (state as TodoSuccessState).todos;
      emit(const TodoLoadingState());

      final response = await delete.call(todoDTO: event.todo);
      emit(
        response.fold(
          (left) => TodoErrorState(error: left.message),
          (right) {
            if (right) {
              todos.removeWhere((item) => item.id == event.todo.id);
            }
            return TodoSuccessState(todos: todos);
          },
        ),
      );
    });
  }

  // get aFazer => (state as TodoSuccessState).todos.where((todo) => todo.status == 'X').length;
  get aFazer => 25;
  get andamento => 15;
  get finalizado => 5;
}
