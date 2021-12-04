import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/todo_usecase.dart';
import 'domain/usecases/todo_usecase_impl.dart';
import 'external/adapter/todo_database_adapter.dart';
import 'external/datasources/todo_local_datasource_impl.dart';
import 'infra/repositories/todo_repository_impl.dart';
import 'presenter/bloc/todo_bloc.dart';
import 'presenter/views/todo_view.dart';

class TodoModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => TodoDatabaseAdapter(database: i.get())),
        Bind((i) => TodoLocalDatasourceImpl(
              adapter: i.get<TodoDatabaseAdapter>(),
            )),
        Bind((i) => TodoRepositoryImpl(datasource: i.get())),
        Bind((i) => TodoUsecaseSelectImpl(repository: i.get())),
        Bind((i) => TodoUsecaseDeleteImpl(repository: i.get())),
        Bind((i) => TodoUsecaseInsertImpl(repository: i.get())),
        Bind((i) => TodoUsecaseUpdateImpl(repository: i.get())),
        Bind((i) => TodoBloc(
              select: i.get<TodoUsecaseSelect>(),
              delete: i.get<TodoUsecaseDelete>(),
              insert: i.get<TodoUsecaseInsert>(),
              update: i.get<TodoUsecaseUpdate>(),
            )),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const TodoView()),
      ];
}
