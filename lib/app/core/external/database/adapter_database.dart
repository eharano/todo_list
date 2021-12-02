abstract class AdapterDatabase {
  String get table;

  Future<int> insert(
    Map<String, dynamic> object,
  );

  Future<int> delete({
    required String where,
    required List<dynamic> args,
  });

  Future<int> update({
    required Map<String, dynamic> object,
    required String where,
    required List<dynamic> args,
  });

  Future<List<Map<String, Object?>>> querySql({
    required String sql,
    List<dynamic>? args,
  });

  Future<List<Map<String, Object?>>> query({
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? args,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  });
}
