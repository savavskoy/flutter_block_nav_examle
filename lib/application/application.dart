import 'package:flutter/material.dart';
import '../ui/features/option_chose/view/screens/option_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OptionScreen(),
    );
  }
}
