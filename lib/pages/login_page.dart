import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(220, 220, 220, 1.0),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                300, MediaQuery.of(context).size.height * 0.02, 300, 100),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/securetrack_logo.png")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Image logoWidget(String ImageName) {
  return Image.asset(
    ImageName,
    width: 500,
    height: 500,
    color: Color.fromRGBO(128, 0, 0, 1.0),
  );
}
