import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/app/app_theme.dart';

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

    controller.add(TodoInsertEvent(
      todo: TodoDTO.fromEntity(todo),
    ));
  }

  deleteTodo() {
    Todo todo = const Todo(
      id: 1,
      title: 'teste de todo',
      status: 'a fazer',
      data: '02/12/2021',
      label: 'Programação',
    );

    // controller.delete(TodoDeleteEvent(
    //   todo: TodoDTO.fromEntity(todo),
    // ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodoBarWidget(
        controller: controller,
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          bottom: 40.0,
        ),
        children: [
          for (int i = 0; i < 100; i++) Text("MInha lista $i"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.appBar,
          onPressed: () => {},
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}

class TodoBarWidget extends PreferredSize {
  final TodoBloc controller;

  TodoBarWidget({
    Key? key,
    required this.controller,
  }) : super(
          key: key,
          child: SizedBox(
            width: double.infinity,
            height: 200.0,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: AppTheme.appBar,
                  height: 135.0,
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "Todo List",
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.aFazer.toString(),
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text("A Fazer"),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.andamento.toString(),
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text("Em andamento"),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.finalizado.toString(),
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text("Finalizado"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          preferredSize: const Size.fromHeight(200.0),
        );
}
