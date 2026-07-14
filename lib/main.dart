import 'package:flutter/material.dart';

import 'Auth/SignIn/SignIn.dart';
import 'core/homeNav/BottomNavBar/NavBar.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'STORE ',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home:  LoginScreen(),
    );
  }
}