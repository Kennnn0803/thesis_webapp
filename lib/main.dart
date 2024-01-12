import 'package:flutter/material.dart';
import 'package:thesis_webapp/pages/auth_page.dart';
import 'package:thesis_webapp/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: AuthPage(),
    );
  }
}
