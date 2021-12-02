import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/app/modules/todo/external/adapter/todo_database_adapter.dart';

import '../../core/external/database/config/database_config.dart';
import 'domain/usecases/todo_usecase_impl.dart';
import 'external/datasources/todo_local_datasource_impl.dart';
import 'infra/repositories/todo_repository_impl.dart';
import 'presenter/bloc/todo_bloc.dart';
import 'presenter/views/todo_view.dart';

class TodoModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        AsyncBind<Database>((i) => DatabaseConfig.getInstance()),
        Bind((i) => TodoDatabaseAdapter(database: i.get())),
        Bind((i) => TodoLocalDatasourceImpl(
              adapter: i.get<TodoDatabaseAdapter>(),
            )),
        Bind((i) => TodoRepositoryImpl(datasource: i.get())),
        Bind((i) => TodoUsecaseImpl(repository: i.get())),
        Bind((i) => TodoBloc(usecase: i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const TodoView()),
      ];
}
