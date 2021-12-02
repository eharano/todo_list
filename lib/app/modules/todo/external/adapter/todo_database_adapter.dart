import 'package:sqflite/sqlite_api.dart';
import 'package:todo_list/app/core/external/database/adapter_database_impl.dart';

class TodoDatabaseAdapter extends AdapterDatabaseImpl {
  TodoDatabaseAdapter({
    required Database database,
  }) : super(
          database: database,
          table: 'TODO',
        );
}
