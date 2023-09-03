import 'package:flutter/material.dart';

import 'package:riverpod_todo_app/models/task.dart';

import 'package:riverpod_todo_app/modules/todos_view/widget/todos_view_widget.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    super.key,
    required this.deviceHeigth,
    required this.todos,
  });

  final double deviceHeigth;
  final List<Task> todos;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeigth * 0.28,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TodosViewWidget(
        todos: todos,
      ),
    );
  }
}
