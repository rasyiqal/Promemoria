import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 32,
              ),
              child: Image.asset(
                'assets/logo.png',
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 32,
              ),
              child: Image.asset(
                'assets/splash_logo.png',
                scale: 0.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
