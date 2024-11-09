import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int countdown = 3;
  @override
  void initState() {
    super.initState(); // initState ke andar super call karna zaroori hai
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, "/HomeScreen");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Add gradient background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE8B3E5), // Light pink
              Color(0xFF7e0c73), // Deep purple
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Lottie.asset(
            'asset/quiz_animation.json', // Path to your animation file
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
