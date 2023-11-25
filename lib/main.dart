import 'package:flutter/material.dart';
import 'package:thesis_webapp/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Secure Track",
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(220, 220, 220, 1.0),
      ),
      home: LogInScreen(),
    );
  }
}
