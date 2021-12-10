import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/app/modules/todo/presenter/views/todo_edit_view.dart';

import '../../../../app_theme.dart';
import '../../domain/dtos/todo_dto.dart';
import '../../domain/entities/todo.dart';
import '../widgets/todo_bar_widget.dart';
import '../widgets/todo_list.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodoBarWidget(
        controller: controller,
      ),
      body: const TodoListWidget(
        todos: [],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.cDefault,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const TodoEditView();
              },
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
