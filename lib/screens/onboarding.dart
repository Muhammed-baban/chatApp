import 'package:chat/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:chat/utils/theme.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Stack(
          children: [
            SizedBox(
              height: 500,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/images/ellipse.png',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    'assets/images/miniSubtract.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                SizedBox(width: 6),
                Text(
                  'Chatbox',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Connect friends",
                    style: TextStyle(fontSize: 78, color: white),
                  ),
                  Text("easily & quickly",
                      style: TextStyle(
                          fontSize: 78,
                          fontWeight: FontWeight.bold,
                          color: white)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                        "Our chat app is the perfect way to stay connected with friends and family.",
                        style: TextStyle(
                          fontSize: 20,
                          color: fontPlaceholder,
                        )),
                  ),
                  CustomButton(
                    text: 'Sign up with mail',
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/signup');
                    },
                    color: white,
                    textColor: black,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed('/signin');
                        },
                        child: Text(
                          "Existing account?",
                          style: TextStyle(
                            fontSize: 14,
                            color: fontPlaceholder,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed('/signin');
                        },
                        child: Text(" Log in",
                            style: TextStyle(
                                fontSize: 14,
                                color: white,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
