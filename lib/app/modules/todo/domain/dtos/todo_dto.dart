class TodoDTO {
  final int? id;
  final String title;
  final String? description;
  final String status;
  final String data;
  final String label;

  TodoDTO({
    this.id,
    required this.title,
    this.description,
    required this.status,
    required this.data,
    required this.label,
  });

  TodoDTO copyWith({
    int? id,
    String? title,
    String? description,
    String? status,
    String? data,
    String? label,
  }) {
    return TodoDTO(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      data: data ?? this.data,
      label: label ?? this.label,
    );
  }
}
