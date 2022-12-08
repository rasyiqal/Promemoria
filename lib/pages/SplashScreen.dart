import 'dart:async';

import 'package:doa/pages/Login/LoginPage.dart';
import 'package:doa/theme/theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  Function setTheme;
  SplashScreen({Key? key, required this.setTheme}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    Timer(Duration(milliseconds: 1500), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  Image.asset(
                    'assets/splash_1.png',
                    height: 180,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Prememoria',
                      style: deepPurpleTextStyle.copyWith(
                        fontSize: 32,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
