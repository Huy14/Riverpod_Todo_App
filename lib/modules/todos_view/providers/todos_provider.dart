import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_todo_app/models/task.dart';

class TodosNotifier extends StateNotifier<List<Task>> {
  TodosNotifier() : super([]);

  void add(Task task) {
    state = [...state, task];
  }

  void update(Task task, bool value) {
    task.isCompleted = value;
    state = [...state];
  }

  void delete(Task task, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Todo Task'),
          content: Text('Do you want to delete ${task.title} task?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (state.remove(task)) {
                  state = [...state];
                }
                Navigator.pop(context);
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}

final todosProvider =
    StateNotifierProvider<TodosNotifier, List<Task>>((ref) => TodosNotifier());

final todosData = Provider((ref) {
  final data = ref.watch(todosProvider);

  return data.where((todo) => todo.isCompleted == false).toList();
});

final unCompletedTodosData = Provider((ref) {
  final data = ref.watch(todosProvider);

  return data.where((todo) => todo.isCompleted == true).toList();
});
