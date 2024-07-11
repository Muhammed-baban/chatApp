import 'package:chat/widget/button.dart';
import 'package:chat/widget/input.dart';
import 'package:flutter/material.dart';
import 'package:chat/utils/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool active = false;
  String email = '';
  String password = '';
  String confrimPassword = '';

  void _updateActiveState() {
    setState(() {
      active = email.contains('@') &&
          email.contains('.com') &&
          password.length >= 6 &&
          confrimPassword.length >= 6 &&
          password == confrimPassword;
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
                      'Sign up with Email',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "Get chatting with friends and family today by signing up for our chat app!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: fontPlaceholder,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    CustomInput(
                      title: 'Your name',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomInput(
                      title: 'Your email',
                      onChanged: (value) {
                        email = value;
                        _updateActiveState();
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomInput(
                        title: 'Password',
                        isPassword: true,
                        onChanged: (value) {
                          password = value;
                          _updateActiveState();
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    CustomInput(
                        title: 'Confirm Password',
                        isPassword: true,
                        onChanged: (value) {
                          confrimPassword = value;
                          _updateActiveState();
                        }),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                CustomButton(
                  text: 'Create an account',
                  active: active,
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/signin');
                  },
                  color: active ? primary : disabledButton,
                  textColor: active ? white : fontPlaceholder,
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
