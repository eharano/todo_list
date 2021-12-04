import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqflite/sqflite.dart';

import '../core/external/database/config/database_config.dart';
import 'splash/splash.dart';
import 'todo/todo_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        AsyncBind<Database>((i) => DatabaseConfig.getInstance()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (context, _) => const Splash()),
        ModuleRoute("/todo", module: TodoModule()),
      ];
}
