import 'package:chat/widget/button.dart';
import 'package:chat/widget/input.dart';
import 'package:flutter/material.dart';
import 'package:chat/utils/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool active = false;
  String email = '';
  String password = '';

  void _updateActiveState() {
    setState(() {
      active =
          email.contains('@') && email.contains('.com') && password.length >= 6;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.only(top: 60, right: 24, left: 24),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/onboarding');
                          },
                          child: SvgPicture.asset(
                            'assets/icons/Back.svg',
                            width: 30.0,
                            height: 30.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 53,
                    ),
                    Text(
                      'Log in to Chatbox',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "Welcome back! Sign in using your social account or email to continue us",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: fontPlaceholder,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 53,
                    ),
                    CustomInput(
                      title: 'Your email',
                      onChanged: (value) {
                        email = value;
                        _updateActiveState();
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomInput(
                      title: 'Password',
                      isPassword: true,
                      onChanged: (value) {
                        password = value;
                        _updateActiveState();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                CustomButton(
                  text: 'Log in',
                  active: active,
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/home');
                  },
                  color: active ? primary : disabledButton,
                  textColor: active ? white : fontPlaceholder,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 37,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
