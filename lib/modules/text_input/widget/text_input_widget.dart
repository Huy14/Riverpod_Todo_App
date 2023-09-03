import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextInputWidget extends ConsumerWidget {
  const TextInputWidget({
    super.key,
    required this.type,
    required this.bottomWidth,
    required this.controller,
  });

  final String type;
  final double bottomWidth;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorMsg;
        }
        return null;
      },
      onSaved: (newValue) {
        controller.text = newValue!;
      },
      textAlignVertical: hintAlignment,
      decoration: InputDecoration(
        filled: true,
        hintText: type,
        fillColor: Colors.grey.shade300,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 10, 0, bottomWidth),
      ),
    );
  }

  // Getter
  String get errorMsg =>
      type == 'Task Title' ? 'Task title is missing!' : 'Notes is missing!';

  TextAlignVertical get hintAlignment =>
      type == 'Task Title' ? TextAlignVertical.center : TextAlignVertical.top;
}
