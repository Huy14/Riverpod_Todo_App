import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_todo_app/modules/date_time/providers/date_provider.dart';
import 'package:riverpod_todo_app/modules/date_time/providers/time_provider.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({super.key, required this.value, required this.type});

  final dynamic value;
  final String type;

  @override
  Widget build(BuildContext context) {
    final String hintText = type == 'Date'
        ? DateFormat.yMMMd().format(value) // Return value as DateTime
        : value.format(context); // Return value as TimeOfDay

    return Consumer(
      builder: (context, ref, child) => GestureDetector(
        onTap: () {
          type == 'Date'
              ? ref.read(dateProvider.notifier).setDateValue(context)
              : ref.read(timeProvider.notifier).setTimeValue(context);
        },
        child: TextFormField(
          enabled: false,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            filled: true,
            suffixIcon: icon,
            hintText: hintText,
            fillColor: Colors.grey.shade300,
            hintStyle: const TextStyle(
              color: Colors.black54,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(14),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          ),
        ),
      ),
    );
  }

  // Getter
  Icon get icon => type == 'Date'
      ? const Icon(Icons.calendar_today)
      : const Icon(Icons.access_time);
}
