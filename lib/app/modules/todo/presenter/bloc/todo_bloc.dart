import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/dtos/todo_paginate_dto.dart';
import '../../domain/usecases/todo_usecase.dart';
import '../../domain/entities/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoUsecase usecase;

  TodoBloc({
    required this.usecase,
  }) : super(const TodoInitialState()) {
    on<TodoFetchEvent>((event, emit) async {
      emit(const TodoLoadingState());

      final response = await usecase.call(params: event.params);
      emit(
        response.fold(
          (left) => TodoErrorState(error: left.message),
          (right) => TodoSuccessState(todos: right),
        ),
      );
    });

    on<TodoInsertEvent>((event, emit) async {
      emit(const TodoLoadingState());

      // final response = await usecase.call;
    });

    on<TodoUpdateEvent>((event, emit) async {
      emit(const TodoLoadingState());

      // final response = await usecase.call;
    });

    on<TodoDeleteEvent>((event, emit) async {
      emit(const TodoLoadingState());

      // final response = await usecase.call;
    });
  }
}
