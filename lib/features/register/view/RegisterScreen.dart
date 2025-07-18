
import 'package:flutter/material.dart';

import '../../component/TextFieldRow.dart';
import '../../component/outline_button.dart';
import '../../component/text.dart';
import '../../component/text_filed.dart';
import '../../route/app_route.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
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
                    icon: Icon(Icons.arrow_back, size: screenWidth * 0.1),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Sign up with Email",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),

                    const SizedBox(height: 20),
                    const Text(
                      "Get chatting with friends and family today \nby signing up for our chat app!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
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
                    child:
                    TextFiledRow(gap: 0.015,hintText: "user name", icon:Icons.person, label: "Enter name", onChanged: (value) {},text: "Username", color: Colors.black, fontSize: 18, fontWeight:FontWeight.bold)
                ),
              ),
              SizedBox(height: (screenHeight * 0.03)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    child:
                    TextFiledRow(gap: 0.015,hintText: "ali@gmail.com", icon:Icons.email_outlined, label: "Enter Email", onChanged: (value) {},text: "Email", color: Colors.black, fontSize: 18, fontWeight:FontWeight.bold)
                ),
              ),
              SizedBox(height: (screenHeight * 0.03)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    child:
                    TextFiledRow(isPhone:true,gap: 0.015,hintText: "01*********", icon:Icons.phone_android_outlined, label: "Enter Phone", onChanged: (value) {},text: "Phone Number", color: Colors.black, fontSize: 18, fontWeight:FontWeight.bold)
                ),
              ),
              SizedBox(height: (screenHeight * 0.03)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: CustomText(
                    text: "Password",
                    color: Colors.black,
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
                  child: CustomPasswordTextField(onChanged: (value) {}),
                ),
              ),
              SizedBox(height: (screenHeight * 0.03)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: CustomText(
                    text: "Confirm Password",
                    color: Colors.black,
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
                  child: CustomPasswordTextField( hint : "Confirm Password",onChanged: (value) {}),
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
                    backgroundColor: Colors.orange,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoute.login);
                    },
                  ),
                ),
              ),
              SizedBox(height: screenHeight*0.08,)
            ],
          ),
        ),
      ),
    );
  }
}
