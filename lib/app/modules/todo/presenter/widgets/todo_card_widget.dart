import 'package:flutter/material.dart';
import 'package:todo_list/app/app_theme.dart';

class TodoCardWidget extends StatelessWidget {
  final TodoTag todoTag;
  final String title;
  final String description;

  const TodoCardWidget({
    Key? key,
    required this.todoTag,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5.0),
      child: InkWell(
        splashColor: AppTheme.cDefault.withAlpha(30),
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            ListTile(
              leading: Icon(todoTag.icon),
              title: Text(title),
              subtitle: Text(description),
            ),
          ],
        ),
      ),
    );
  }
}

enum TodoTag { corrida, leitura, cinema, reuniao }

extension TodoTagType on TodoTag {
  IconData get icon {
    switch (this) {
      case TodoTag.corrida:
        return Icons.running_with_errors;
      case TodoTag.leitura:
        return Icons.book;
      case TodoTag.cinema:
        return Icons.movie;
      case TodoTag.reuniao:
        return Icons.coffee;
    }
  }

  String get text {
    switch (this) {
      case TodoTag.corrida:
        return "Corrida";
      case TodoTag.leitura:
        return "Leitura";
      case TodoTag.cinema:
        return "Cinema";
      case TodoTag.reuniao:
        return "Reunião";
    }
  }

  Color get color {
    switch (this) {
      case TodoTag.corrida:
        return Colors.pink.shade400;
      case TodoTag.leitura:
        return Colors.blueAccent.shade200;
      case TodoTag.cinema:
        return Colors.purpleAccent.shade200;
      case TodoTag.reuniao:
        return Colors.orangeAccent.shade200;
    }
  }
}
