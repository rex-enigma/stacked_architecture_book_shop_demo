import 'package:flutter/material.dart';
import 'package:stacked_architecture_shopper_test/screens/bookList_screen.dart';
import './shared/dependency_injection.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      title: 'test viewModel',
      home: const HomeScreen(),
    );
  }
}
