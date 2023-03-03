import 'package:flutter/material.dart';
import 'package:register/Screens/animatedList.dart';
import 'package:register/Screens/login.dart';
import 'package:register/Screens/register.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple, primaryColor: Colors.deepPurple),
      home: const Login(),
    );
  }
}

