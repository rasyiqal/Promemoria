import 'package:doa/pages/Home/HomePage.dart';
import 'package:doa/pages/Login/LoginPage.dart';
import 'package:doa/pages/Register/RegisterPage.dart';
import 'package:doa/pages/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      routes: {
        // '/':(context) => SplashScreen(),
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
