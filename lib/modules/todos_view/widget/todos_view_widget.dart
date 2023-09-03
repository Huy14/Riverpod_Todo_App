import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_todo_app/models/task.dart';

import 'package:riverpod_todo_app/modules/todos_view/providers/todos_provider.dart';

import 'package:riverpod_todo_app/utils/helpers.dart';

class TodosViewWidget extends ConsumerWidget {
  const TodosViewWidget({
    super.key,
    required this.todos,
  });

  final List<Task> todos;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Helpers.showTodoDetails(
            context,
            todos[index],
          );
        },
        onLongPress: () {
          ref.read(todosProvider.notifier).delete(
                todos[index],
                context,
              );
        },
        leading: CircleAvatar(
          backgroundColor: todos[index].category.color.withOpacity(0.5),
          child: Icon(
            todos[index].category.icon,
            color: todos[index].category.color,
          ),
        ),
        title: Text(
          todos[index].title,
        ),
        subtitle: Text(todos[index].time),
        trailing: todos[index].isCompleted == true
            ? null
            : Checkbox(
                value: todos[index].isCompleted,
                onChanged: (value) {
                  ref.read(todosProvider.notifier).update(todos[index], value!);
                },
              ),
      ),
    );
  }
}
