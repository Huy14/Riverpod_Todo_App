import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notesProvider =
    StateProvider.autoDispose((ref) => TextEditingController());
