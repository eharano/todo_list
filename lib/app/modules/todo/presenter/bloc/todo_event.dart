part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class TodoFetchEvent extends TodoEvent {
  final TodoPaginateDTO params;

  const TodoFetchEvent({
    required this.params,
  });

  @override
  List<Object?> get props => [params];
}

class TodoPaginateEvent extends TodoEvent {
  final TodoPaginateDTO params;

  const TodoPaginateEvent({
    required this.params,
  });

  @override
  List<Object?> get props => [params];
}

class TodoInsertEvent extends TodoEvent {
  final Todo todo;

  const TodoInsertEvent({
    required this.todo,
  });

  @override
  List<Object?> get props => [todo];
}

class TodoUpdateEvent extends TodoEvent {
  final Todo todo;

  const TodoUpdateEvent({
    required this.todo,
  });

  @override
  List<Object?> get props => [todo];
}

class TodoDeleteEvent extends TodoEvent {
  final Todo todo;

  const TodoDeleteEvent({
    required this.todo,
  });

  @override
  List<Object?> get props => [todo];
}
