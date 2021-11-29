import 'package:flutter/material.dart';

import '../../domain/entities/todo.dart';

class TodoList extends StatelessWidget {
  final Todo todo;

  const TodoList({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(),
    );
  }
}
