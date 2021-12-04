import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/dtos/todo_dto.dart';
import '../../domain/entities/todo.dart';
import '../bloc/todo_bloc.dart';

class TodoView extends StatefulWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends ModularState<TodoView, TodoBloc> {
  @override
  initState() {
    super.initState();
    // controller
  }

  insertTodo() {
    Todo todo = const Todo(
      title: 'teste de todo',
      status: 'a fazer',
      data: '02/12/2021',
      label: 'Programação',
    );
    controller.add(TodoInsertEvent(todo: TodoDTO.fromEntity(todo)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          insertTodo();
        },
        // child: ,
      ),
      body: const Text("Teste"),
    );
  }
}
