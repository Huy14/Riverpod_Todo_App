import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_todo_app/models/task_categories.dart';

import 'package:riverpod_todo_app/modules/categories/export/categories_export.dart';

class CategoriesWidget extends ConsumerWidget {
  const CategoriesWidget({
    super.key,
    required this.categories,
  });

  final List<TaskCategories> categories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: InkWell(
            onTap: () {
              ref.read(categoriesProvider.notifier).updateCategory(
                    categories[index],
                    context,
                  );
            },
            customBorder: const CircleBorder(),
            splashColor: categories[index].color.withOpacity(0.5),
            child: CircleAvatar(
              backgroundColor: categories[index].color.withOpacity(0.5),
              child: Icon(
                categories[index].icon,
                color: categories[index].color,
              ),
            ),
          ),
        );
      },
    );
  }
}
