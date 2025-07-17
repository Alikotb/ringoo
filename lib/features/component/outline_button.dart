import 'package:flutter/material.dart';

import 'text.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback onPressed;
  final Color backgroundColor;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.onPressed,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: textColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        backgroundColor: backgroundColor,
        minimumSize: Size(double.infinity, 0),
      ),

      onPressed: onPressed,
      child: CustomText(
        text: text,
        color: textColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
