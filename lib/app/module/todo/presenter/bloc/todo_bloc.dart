import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_list/app/module/todo/domain/dtos/todo_dto.dart';
import 'package:todo_list/app/module/todo/domain/usecases/todo_usecase.dart';

import '../../domain/dtos/todo_paginate_dto.dart';
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

    on<TodoPaginateEvent>((event, emit) async {
      emit((state as TodoSuccessState).copyWith(isLoading: true));

      var response = await usecase(params: event.params);
      var paginateState = response.fold((left) {
        // TODO criar o load de erro de acordo com o banco de dados
      }, (r) => null);
    });
  }
}
