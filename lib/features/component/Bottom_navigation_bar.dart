
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CurvedBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CurvedBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.orange,
      backgroundColor: Colors.transparent,
      height: 60,
      index: currentIndex,
      items: const [
        Icon(Icons.message_outlined, size: 30,color: Colors.white),
        Icon(Icons.call_outlined, size: 30,color: Colors.white),
        Icon(Icons.group_add_outlined, size: 30,color: Colors.white),
        Icon(Icons.settings_outlined, size: 30,color: Colors.white),
      ],
      onTap: onTap,
    );
  }
}
