import 'package:flutter/material.dart';
import 'package:mad_project/AIquiz.dart';
import 'package:mad_project/HomeScreen.dart';
import 'package:mad_project/MADquiz.dart';
import 'package:mad_project/SplashScreen.dart';
import 'package:mad_project/dmQuiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Set initial route to splash screen
      initialRoute: "/",
      routes: {
        // Define routes for navigation
        "/": (context) {
          return SplashScreen();
        },
        "/HomeScreen": (context) => HomeScreen(),
        "/dmQuiz": (context) => MCQScreenDM(),
        "/MADquiz": (context) => MCQScreenMAD(),
        "/AIquiz": (context) => MCQScreenAI(),
      },
    );
  }
}
