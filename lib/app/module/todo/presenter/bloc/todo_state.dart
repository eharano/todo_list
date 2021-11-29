part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoInitialState extends TodoState {
  const TodoInitialState();

  @override
  List<Object> get props => [];
}

class TodoLoadingState extends TodoState {
  const TodoLoadingState();

  @override
  List<Object> get props => [];
}

class TodoErrorState extends TodoState {
  final String error;

  const TodoErrorState({required this.error});

  @override
  List<Object> get props => [];
}

class TodoSuccessState extends TodoState {
  final List<Todo> todos;
  final bool isLoading;

  const TodoSuccessState({
    required this.todos,
    this.isLoading = false,
  });

  TodoSuccessState copyWith({
    List<Todo>? todos,
    bool? isLoading,
  }) {
    return TodoSuccessState(
      todos: todos ?? this.todos,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [todos];
}
