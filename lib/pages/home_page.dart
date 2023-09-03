import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_todo_app/models/app_style.dart';

import 'package:riverpod_todo_app/pages/add_task_page.dart';

import 'package:riverpod_todo_app/widgets/appbar_header.dart';
import 'package:riverpod_todo_app/widgets/listview_widget.dart';

import 'package:riverpod_todo_app/modules/todos_view/providers/todos_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    final todos = ref.watch(todosData);
    final uncompletedTodos = ref.watch(unCompletedTodosData);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              AppBarHeader(
                deviceHeight: deviceHeight,
                deviceWidth: deviceWidth,
              ),
            ],
          ),
          Positioned(
            top: 140,
            left: 10,
            right: 10,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListViewWidget(
                    deviceHeigth: deviceHeight,
                    todos: todos,
                  ),
                  const Gap(10),
                  const Text(
                    'Completed',
                    style: AppStyle.label,
                  ),
                  const Gap(10),
                  ListViewWidget(
                    deviceHeigth: deviceHeight,
                    todos: uncompletedTodos,
                  ),
                  const Gap(20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AddTaskPage(),
                        ),
                      );
                    },
                    style: AppStyle.buttonStyle.copyWith(
                      backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.primary,
                      ),
                      foregroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    child: const Text(
                      'Add New Task',
                      style: AppStyle.label,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
