import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/views/todo_view.dart';

class TodoModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const TodoView()),
      ];
}
