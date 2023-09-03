import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_todo_app/models/task_categories.dart';

class CategoriesProvider extends StateNotifier<TaskCategories> {
  CategoriesProvider() : super(TaskCategories.stringToTaskCategory('others'));

  void updateCategory(TaskCategories category, BuildContext context) {
    state = category;

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1000),
        content: Text('Selected Category: ${state.name}'),
      ),
    );
  }
}

final categoriesProvider =
    StateNotifierProvider<CategoriesProvider, TaskCategories>(
        (ref) => CategoriesProvider());
