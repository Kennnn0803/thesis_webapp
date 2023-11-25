import 'package:flutter/material.dart';

Image SecureTrackLogo(String ImageName) {
  return Image.asset(
    ImageName,
    width: 400,
    height: 250,
    color: Color.fromRGBO(128, 0, 0, 1.0),
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Color.fromRGBO(0, 0, 0, 1.0),
    style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1.0)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Color.fromRGBO(0, 0, 0, 1.0),
      ),
      labelText: text,
      labelStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, .9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}
