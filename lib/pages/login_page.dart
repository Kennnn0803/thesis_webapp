import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thesis_webapp/pages/home_screen.dart';
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
                reusableTextField(
                  "Enter Username",
                  Icons.person_outline,
                  false,
                  _emailTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Enter Password",
                  Icons.lock_outline,
                  true,
                  _passwordTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Sign In", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                      )
                      .then((value) {
                        // Successful login
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      })
                      .catchError((error) {
                        // Handle login errors
                        String errorMessage = "An error occurred during login.";

                        // Check specific error codes and customize error messages
                        if (error.code == 'user-not-found') {
                          errorMessage = 'Email not registered!';
                        } else if (error.code == 'wrong-password') {
                          errorMessage = 'Wrong Password';
                        }

                        // Show error message using a pop-up or other UI element
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Login Error"),
                              content: Text(errorMessage),
                              actions: [
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );

                        print("Error ${error.toString()}");
                      });
                }),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }
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
