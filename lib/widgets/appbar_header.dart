import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:riverpod_todo_app/models/app_style.dart';

class AppBarHeader extends StatelessWidget {
  const AppBarHeader({
    super.key,
    required this.deviceHeight,
    required this.deviceWidth,
  });

  final double deviceHeight;
  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight * 0.3,
      width: deviceWidth,
      color: Colors.purple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat.yMMMEd().format(
              DateTime.now(),
            ),
            style: AppStyle.dateTitle.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          Text(
            'My Todo List',
            style: AppStyle.title.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
