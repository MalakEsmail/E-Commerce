import 'package:e_commerce/screens/login_screen.dart';
import 'package:e_commerce/screens/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: LoginScreen.id, routes: {
      LoginScreen.id: (context) => LoginScreen(),
      SignUpScreen.id: (context) => SignUpScreen(),
    });
  }
}
