import 'package:flutter/material.dart';

import '../../domain/entities/todo.dart';
import 'todo_card_widget.dart';

class TodoListWidget extends StatelessWidget {
  final List<Todo> todos;

  const TodoListWidget({
    Key? key,
    required this.todos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 40.0,
      ),
      children: List.generate(
        10,
        (index) => TodoCardWidget(
          todoTag: (index % 2 == 0) ? TodoTag.cinema : TodoTag.corrida,
          title: "Teste $index",
          description: "descricao da atividade",
        ),
      ),
    );
  }
}
