import 'package:clock_app/views/clock_screen_with_ui.dart';
import 'package:clock_app/views/simple_clock_home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clock App',
      home: HomeScreen(),
    );
  }
}
