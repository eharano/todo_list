abstract class AdapterDatabase {
  Future<int> insert(
    String table,
    Map<String, dynamic> object,
  );

  Future<int> delete(
    String table,
    String where,
    List<dynamic> args,
  );

  Future<int> update(
    String table,
    Map<String, dynamic> object,
    String where,
    List<dynamic> args,
  );

  Future<List<Map<String, Object?>>> querySql(
    String sql,
    List<dynamic>? args,
  );

  Future<List<Map<String, Object?>>> query(
    String table,
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? args,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  );
}
