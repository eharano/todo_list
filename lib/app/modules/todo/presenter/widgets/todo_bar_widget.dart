import 'package:flutter/material.dart';

import '../../../../app_theme.dart';
import '../bloc/todo_bloc.dart';

class TodoBarWidget extends PreferredSize {
  final TodoBloc controller;

  TodoBarWidget({
    Key? key,
    required this.controller,
  }) : super(
          key: key,
          preferredSize: const Size.fromHeight(200.0),
          child: SizedBox(
            width: double.infinity,
            height: 200.0,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: AppTheme.cDefault,
                  height: 140.0,
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              "Todo List",
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                              ),
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
                        child: SizedBox(
                          height: 90,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TodoBarOptionTextWidget(
                                counter: controller.aFazer.toString(),
                                description: "A Fazer",
                                iconPosition: 0,
                              ),
                              TodoBarOptionTextWidget(
                                counter: controller.andamento.toString(),
                                description: "Em andamento",
                                iconPosition: 1,
                              ),
                              TodoBarOptionTextWidget(
                                counter: controller.finalizado.toString(),
                                description: "Concluído",
                                iconPosition: 2,
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
        );
}

class TodoBarOptionTextWidget extends StatelessWidget {
  final String counter;
  final String description;
  final int iconPosition;

  final List<Map<String, dynamic>> _listIcons = [
    {'icon': Icons.update, 'color': Colors.grey},
    {'icon': Icons.replay_outlined, 'color': Colors.blueAccent[400]},
    {'icon': Icons.public, 'color': Colors.green},
  ];

  TodoBarOptionTextWidget({
    Key? key,
    required this.counter,
    required this.description,
    required this.iconPosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          _listIcons[iconPosition]['icon'],
          color: _listIcons[iconPosition]['color'],
          size: 35.0,
        ),
        Text(
          counter,
          style: const TextStyle(
            fontSize: 10.0,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          description,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
