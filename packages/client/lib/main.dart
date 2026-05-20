import 'package:fluentepub/config/dark_theme.dart';
import 'package:fluentepub/config/light_theme.dart';
import 'package:fluentepub/features/home/screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluent Epub',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}
