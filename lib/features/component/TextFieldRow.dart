import 'package:flutter/cupertino.dart';
import 'package:ringoo/features/component/text.dart';
import 'package:ringoo/features/component/text_filed.dart';

class TextFiledRow extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final String label;
  final Function(String) onChanged;
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final double gap;
  final bool isPhone;

  const TextFiledRow({
    super.key,
    required this.hintText,
    required this.icon,
    required this.label,
    required this.onChanged,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    this.gap = 0.025,
    this.isPhone=false,
  });

  @override
  State<TextFiledRow> createState() => _TextFiledRowState();
}

class _TextFiledRowState extends State<TextFiledRow> {
  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        CustomText(
          text: widget.text,
          color: widget.color,
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
        ),
        SizedBox(height: (screenHeight * widget.gap)),
        CustomTextField(
          isPhone: widget.isPhone,
          hintText: widget.hintText,
          icon: widget.icon,
          label: widget.label,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
