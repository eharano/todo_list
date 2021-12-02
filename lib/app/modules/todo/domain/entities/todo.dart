import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final int? id;
  final String title;
  final String? description;
  final String status;
  final String data;
  final String label;

  const Todo({
    this.id,
    required this.title,
    this.description,
    required this.status,
    required this.data,
    required this.label,
  });

  @override
  List<Object?> get props => [id, title, status, data, label];
}
