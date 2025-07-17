
import 'package:flutter/material.dart';
import 'package:ringoo/features/log_in/view/LoginScreen.dart';
import 'package:ringoo/features/profile/view/ProfileScreen.dart';
import 'package:ringoo/features/register/view/RegisterScreen.dart';

import '../chat/view/ChatScreen.dart';
import '../home/view/HomeScreen.dart';
import 'app_route.dart';

class RouteGenerator {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.register:
        return MaterialPageRoute(builder: (context) => RegisterScreen());
      case AppRoute.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case AppRoute.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case AppRoute.chat:
        return MaterialPageRoute(builder: (context) => ChatScreen());
      case AppRoute.profile:
        return MaterialPageRoute(builder: (context) => ProfileScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(child: Text('Page not found')),
           )
        );
    }
  }
}