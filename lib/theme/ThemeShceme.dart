import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Color(0xff1dab61), //login button color floating action btn
    onPrimary: Color(0xff135e3d), //nav bar color
    secondary: Color(0xffd8fdd2), //message background
    surface: Colors.white, ////page background
    onSurface: Color(0xfff5f2eb), //chat background
    scrim: Colors.black, //text background
    onPrimaryContainer: Colors.white, //message background
    onSecondary: Color(0xfff6f5f3), //search bar background
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Color(0xff1dab61),//login button color floating action btn
    onPrimary: Color(0xffd5fcd0),//nav bar color
    secondary: Color(0xff134d37),//message background
    surface: Color(0xff0b1014),//page background 141118
    onSurface: Color(0xff0b1014),//chat background
    scrim: Colors.white, //text background
    onPrimaryContainer: Color(0xff1f272a),//message background
    onSecondary: Color(0xff23282c), //search bar background
  ),
);
