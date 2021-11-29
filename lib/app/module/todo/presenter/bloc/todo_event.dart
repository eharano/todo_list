part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class TodoFetchEvent extends TodoEvent {
  final TodoDTO params;

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
