class TodoPaginateDTO {
  final int offset;
  final int limit;

  TodoPaginateDTO({
    required this.offset,
    required this.limit,
  });

  TodoPaginateDTO copyWith({
    int? offset,
    int? limit,
  }) {
    return TodoPaginateDTO(
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'offset': offset,
      'limit': limit,
    };
  }
}
