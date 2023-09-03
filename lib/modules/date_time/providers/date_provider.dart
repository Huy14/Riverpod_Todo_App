import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateNotifier extends StateNotifier<DateTime> {
  DateNotifier() : super(DateTime.now());

  void setDateValue(BuildContext context) async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = now;

    final chosenDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);

    if (chosenDate != null) {
      state = chosenDate;
    } else {
      state = DateTime.now();
    }
  }
}

final dateProvider =
    StateNotifierProvider<DateNotifier, DateTime>((ref) => DateNotifier());
