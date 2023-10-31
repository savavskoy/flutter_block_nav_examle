import 'package:flutter/material.dart';
import 'application/application.dart';
import 'di/locator.dart';

Future<void> main() async {
  await init();
  runApp(const MyApp());
}

init() async {
  setupLocator();
}
