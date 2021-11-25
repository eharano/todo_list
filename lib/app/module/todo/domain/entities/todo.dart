import 'package:equatable/equatable.dart';

class ToDo extends Equatable {
  final int id;
  final String title;
  final String? description;
  final String status;
  final DateTime data;
  final String label;

  const ToDo({
    required this.id,
    required this.title,
    this.description,
    required this.status,
    required this.data,
    required this.label,
  });

  @override
  List<Object?> get props => [id, title, status, data, label];
}
