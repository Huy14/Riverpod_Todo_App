import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_todo_app/models/app_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_todo_app/models/task.dart';
import 'package:riverpod_todo_app/models/task_categories.dart';

import 'package:riverpod_todo_app/modules/date_time/export/date_time_export.dart';
import 'package:riverpod_todo_app/modules/text_input/export/text_input_export.dart';
import 'package:riverpod_todo_app/modules/categories/export/categories_export.dart';

import 'package:riverpod_todo_app/modules/todos_view/providers/todos_provider.dart';

class AddTaskPage extends ConsumerWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = GlobalKey<FormState>();

    final dateValue = ref.watch(dateProvider);
    final timeValue = ref.watch(timeProvider);
    final titleValue = ref.watch(titleProvider);
    final notesValue = ref.watch(notesProvider);
    final categoryValue = ref.watch(categoriesProvider);

    void saveItem() {
      if (formState.currentState!.validate()) {
        formState.currentState!.save();
        ref.read(todosProvider.notifier).add(
              Task(
                title: titleValue.text,
                notes: notesValue.text,
                date: DateFormat.yMMMEd().format(dateValue),
                time: timeValue.format(context),
                category: categoryValue,
                isCompleted: false,
              ),
            );

        Navigator.of(context).pop();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod'),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formState,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Task Title',
                    style: AppStyle.label,
                  ),
                  const Gap(6),
                  TextInputWidget(
                    type: 'Task Title',
                    bottomWidth: 30,
                    controller: titleValue,
                  ),
                  const Gap(14),
                  const SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        Text(
                          'Category',
                          style: AppStyle.label,
                        ),
                        Gap(20),
                        Expanded(
                          child: CategoriesWidget(
                            categories: TaskCategories.values,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Date',
                              style: AppStyle.label,
                            ),
                            const Gap(6),
                            DateTimeWidget(
                              type: 'Date',
                              value: dateValue,
                            ),
                          ],
                        ),
                      ),
                      const Gap(20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Time',
                              style: AppStyle.label,
                            ),
                            const Gap(6),
                            DateTimeWidget(
                              type: 'Time',
                              value: timeValue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(14),
                  const Text(
                    'Notes',
                    style: AppStyle.label,
                  ),
                  const Gap(6),
                  TextInputWidget(
                    type: 'Notes',
                    bottomWidth: 120,
                    controller: notesValue,
                  ),
                  const Gap(20),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          style: AppStyle.buttonStyle,
                          onPressed: () {
                            formState.currentState!.reset();
                          },
                          child: const Text(
                            'Reset',
                            style: AppStyle.label,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: AppStyle.buttonStyle.copyWith(
                            backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.primary,
                            ),
                            foregroundColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          onPressed: saveItem,
                          child: const Text(
                            'Save',
                            style: AppStyle.label,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
