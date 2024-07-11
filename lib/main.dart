import 'package:chat/screens/onboarding.dart';
import 'package:chat/screens/signIn.dart';
import 'package:chat/screens/signup.dart';
import 'package:chat/screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/welcomescreen',
      routes: {
        '/welcomescreen': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/signin': (context) => SignInScreen(),
        '/signup': (context) => SignUpScreen(),
      },
    );
  }
}
