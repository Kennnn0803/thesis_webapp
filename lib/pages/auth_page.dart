import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thesis_webapp/pages/home_screen.dart';
import 'package:thesis_webapp/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //when user is logged in
        if (snapshot.hasData) {
          return HomeScreen();
        }
        //when user is logged out
        else {
          return LogInScreen();
        }
      },
    ));
  }
}
