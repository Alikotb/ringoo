
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../calls/view/CallsScreen.dart';
import '../../component/Bottom_navigation_bar.dart';
import '../../message/view/MessageScreen.dart';
import '../../profile/view/GroupsScreen.dart';
import '../../setting/view/SettingScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  int currentIndex = 0;

  final screens = [
    MessageScreen(),
    CallsScreen(),
    GroupsScreen(),
    SettingScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }


  Future<bool> _handleBackButton() async {
    if (currentIndex != 0) {
      setState(() => currentIndex = 0);
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (!didPop) {
          final shouldPop = await _handleBackButton();
          if (shouldPop) {
            SystemNavigator.pop();
          }
        }
      },
      child: Scaffold(
        extendBody: true,
        body: SafeArea(child: screens[currentIndex]),
        bottomNavigationBar: CurvedBottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTabTapped,
        ),
      ),
    );
  }
}
