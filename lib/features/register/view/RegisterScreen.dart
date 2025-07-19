import 'package:flutter/material.dart';
import 'package:ringoo/features/register/view_model/RegisterViewModel.dart';

import '../../component/TextFieldRow.dart';
import '../../component/outline_button.dart';
import '../../component/text.dart';
import '../../component/text_filed.dart';
import '../../route/app_route.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  final RegisterViewModel viewModel = RegisterViewModel();
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email = "";
  String password = "";
  String confirmPassword = "";
  String phone = "";
  String name = "";

  @override
  void initState() {
    super.initState();
    widget.viewModel.stream.listen((event) {
      if (event == "Success") {
        Navigator.pushReplacementNamed(context, AppRoute.login);
      }
    }, onError: (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
          backgroundColor: Colors.red,
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoute.login);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Theme.of(context).colorScheme.scrim,
                      size: screenWidth * 0.1,
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Sign up with Email",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      "Get chatting with friends and family today \nby signing up for our chat app!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.scrim,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: (screenHeight * 0.05)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: TextFiledRow(
                    gap: 0.015,
                    hintText: "user name",
                    icon: Icons.person,
                    label: "Enter name",
                    onChanged: (value) {
                      name = value;
                    },
                    text: "Username",
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
                  child: TextFiledRow(
                    gap: 0.015,
                    hintText: "ali@gmail.com",
                    icon: Icons.email_outlined,
                    label: "Enter Email",
                    onChanged: (value) {
                      email = value;
                    },
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
                  child: TextFiledRow(
                    isPhone: true,
                    gap: 0.015,
                    hintText: "01*********",
                    icon: Icons.phone_android_outlined,
                    label: "Enter Phone",
                    onChanged: (value) {
                      phone = value;
                    },
                    text: "Phone Number",
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
              SizedBox(height: (screenHeight * 0.015)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: CustomPasswordTextField(onChanged: (value) {
                    password = value;
                  }),
                ),
              ),
              SizedBox(height: (screenHeight * 0.03)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: CustomText(
                    text: "Confirm Password",
                    color: Theme.of(context).colorScheme.scrim,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: (screenHeight * 0.015)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: CustomPasswordTextField(
                    hint: "Confirm Password",
                    onChanged: (value) {
                      confirmPassword = value;
                    },
                  ),
                ),
              ),
              SizedBox(height: (screenHeight * 0.04)),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: CustomOutlinedButton(
                    text: "Create an account",
                    textColor: Colors.white,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    onPressed: () {
                      widget.viewModel.inputValidation(email, password, confirmPassword, phone, name);
                    },
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.08),
            ],
          ),
        ),
      ),
    );
  }
}
