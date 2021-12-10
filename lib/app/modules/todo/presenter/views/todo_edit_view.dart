import 'package:flutter/material.dart';
import 'package:todo_list/app/modules/todo/presenter/widgets/todo_card_widget.dart';

class TodoEditView extends StatefulWidget {
  const TodoEditView({Key? key}) : super(key: key);

  @override
  State<TodoEditView> createState() => _TodoEditViewState();
}

class _TodoEditViewState extends State<TodoEditView> {
  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<TodoTag?> _todoTag = ValueNotifier(null);

  set setTag(TodoTag? todoTag) => _todoTag.value = todoTag;

  TodoTag? get getTag => _todoTag.value;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        children: <Widget>[
          const Text("Formulário Todo"),
          const SizedBox(height: 30.0),
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Titulo",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextFormField(
                    maxLines: 4,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Descrição",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ValueListenableBuilder(
                            valueListenable: _todoTag,
                            builder: (BuildContext context, TodoTag? value, _) {
                              return DropdownButton<TodoTag>(
                                hint: const Text("Tag"),
                                value: value,
                                isExpanded: true,
                                onChanged: (TodoTag? todoTag) =>
                                    setTag = todoTag,
                                items: TodoTag.values.map((item) {
                                  return DropdownMenuItem<TodoTag>(
                                    value: item,
                                    child: Text(item.text),
                                  );
                                }).toList(),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text("12/12/2021 10:00"),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: const Text("Salvar"),
                    onPressed: () {
                      // if (_formKey.currentState.validate()) {
                      print("insert");
                      // }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
