import 'package:riverpod_todo_app/models/task_categories.dart';

class Task {
  final String title;
  final String notes;
  final String date;
  final String time;
  final TaskCategories category;
  bool? isCompleted;

  Task({
    required this.title,
    required this.notes,
    required this.date,
    required this.time,
    required this.category,
    required this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'notes': notes,
      'date': date,
      'time': time,
      'category': category,
      'isCompleted': isCompleted,
    };
  }
}
