import 'package:gap/gap.dart';
import 'package:flutter/material.dart';

import 'package:riverpod_todo_app/models/task.dart';

class Helpers {
  static void showTodoDetails(BuildContext context, Task task) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            children: [
              const Gap(20),
              CircleAvatar(
                backgroundColor: task.category.color.withOpacity(0.5),
                child: Icon(
                  task.category.icon,
                  color: task.category.color,
                ),
              ),
              const Gap(20),
              Text(task.title),
              const Gap(4),
              Text('Created at ${task.time}'),
              const Gap(20),
              task.isCompleted == true
                  ? const Text('Task completed ✅')
                  : Text('Task to be completed on ${task.date} ✅'),
              const Gap(4),
              const Divider(
                thickness: 1.5,
                color: Colors.grey,
              ),
              const Gap(20),
              Text(task.notes)
            ],
          ),
        );
      },
    );
  }
}
