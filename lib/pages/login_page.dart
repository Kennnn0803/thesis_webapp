import 'package:flutter/material.dart';
import 'package:thesis_webapp/pages/signup_screen.dart';
import 'package:thesis_webapp/reusable_widgets/reusable_widgets.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                300, MediaQuery.of(context).size.height * 0.02, 300, 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SecureTrackLogo("assets/images/securetrack_logo.png"),
                const SizedBox(
                  height: 50,
                ),
                reusableTextField("Enter Username", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, true, () {}),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text("No Account Yet?",
          style: TextStyle(color: Color.fromARGB(240, 0, 0, 0))),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUpScreen()));
        },
        child: const Text(
          "  Sign Up",
          style: TextStyle(
              color: Color.fromARGB(240, 0, 0, 0), fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}
