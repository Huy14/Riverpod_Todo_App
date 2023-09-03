import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeNotifier extends StateNotifier<TimeOfDay> {
  TimeNotifier() : super(TimeOfDay.now());

  void setTimeValue(BuildContext context) async {
    final chosenTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (chosenTime != null) {
      state = chosenTime;
    } else {
      state = TimeOfDay.now();
    }
  }
}

final timeProvider =
    StateNotifierProvider<TimeNotifier, TimeOfDay>((ref) => TimeNotifier());
