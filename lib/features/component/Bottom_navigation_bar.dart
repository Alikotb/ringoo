
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
      color: Theme.of(context).colorScheme.onPrimary,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor:Theme.of(context).colorScheme.onPrimary ,
      height: 60,
      index: currentIndex,
      items:  [
        Icon(Icons.message_outlined, size: 30,color:Theme.of(context).colorScheme.primary ),
        Icon(Icons.call_outlined, size: 30,color: Theme.of(context).colorScheme.primary),
        Icon(Icons.group_add_outlined, size: 30,color:Theme.of(context).colorScheme.primary),
        Icon(Icons.settings_outlined, size: 30,color: Theme.of(context).colorScheme.primary),
      ],
      onTap: onTap,
    );
  }
}
