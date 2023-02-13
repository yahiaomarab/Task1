import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task1/screens/home_page.dart';
import 'theme/lightTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


