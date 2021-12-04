import 'package:todo_list/app/modules/todo/domain/entities/todo.dart';

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

  factory TodoDTO.fromEntity(Todo todo) {
    return TodoDTO(
      title: todo.title,
      status: todo.status,
      data: todo.data,
      label: todo.label,
      id: todo.id,
      description: todo.description ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'ID': id,
      'NAME': title,
      'STATUS': status,
      'DATA': data,
      'LABEL': label,
      'DESCRIPTION': description,
    };
  }
}
