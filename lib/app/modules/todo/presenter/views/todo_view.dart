import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/todo_bloc.dart';

class TodoView extends StatefulWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends ModularState<TodoView, TodoBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // controller.add();
        },
        // child: ,
      ),
      body: const Text("Teste"),
    );
  }
}
