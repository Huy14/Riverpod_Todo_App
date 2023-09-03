import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_app/pages/home_page.dart';

final kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromRGBO(140, 20, 252, 1));

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true).copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme(
          color: kColorScheme.primary,
          foregroundColor: kColorScheme.onPrimary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
