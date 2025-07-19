import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ringoo/features/component/TextFieldRow.dart';
import 'package:ringoo/features/component/text.dart';
import 'package:ringoo/features/component/text_filed.dart';
import 'package:ringoo/features/route/app_route.dart';

import '../../../generated/assets.dart';
import '../../component/outline_button.dart';
import '../../home/view/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  DateTime? lastBackPressTime;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        exit(0);
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: (screenHeight * 0.1)),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.3,
                      height: screenWidth * 0.3,
                      child: ClipOval(
                        child: Container(
                          color: Theme.of(context).colorScheme.onPrimary,
                          child: Image.asset(Assets.imgLogo, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Welcome to\nRingoo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: (screenHeight * 0.06)),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: TextFiledRow(
                    hintText: "ali@gmail.com",
                    icon: Icons.email_outlined,
                    label: "Enter Email",
                    onChanged: (value) {},
                    text: "Email",
                    color: Theme.of(context).colorScheme.scrim,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: (screenHeight * 0.03)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: CustomText(
                    text: "Password",
                    color: Theme.of(context).colorScheme.scrim,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: (screenHeight * 0.025)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: CustomPasswordTextField(onChanged: (value) {}),
                ),
              ),
              SizedBox(height: (screenHeight * 0.05)),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: CustomOutlinedButton(
                    text: "Login",
                    textColor: Colors.white,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: (screenHeight * 0.02)),

              Align(
                alignment: Alignment.centerLeft,

                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    children: [
                      CustomText(
                        text: "Don’t have an account yet ?",
                        color: Theme.of(context).colorScheme.scrim,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoute.register);
                        },
                        child: CustomText(
                          text: "Register here",
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
