
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final String label;
  final Function(String) onChanged;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.label,
    required this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}


class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: widget.hintText,
        prefixIcon: Icon(widget.icon),
        label: Text(widget.label),
        hintStyle: TextStyle(color: Colors.black45, fontSize: 16),
      ),
      onChanged: widget.onChanged,
      obscureText:  false,
    );
  }
}



class CustomPasswordTextField extends StatefulWidget {
  final void Function(String)? onChanged;
  final String hint;
  const CustomPasswordTextField({
    super.key,
    this.onChanged, this.hint = "Enter Password",
  });

  @override
  State<CustomPasswordTextField> createState() => _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _isHidden,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: "****************",
        prefixIcon: Icon(Icons.password),
        labelText: widget.hint,
        hintStyle: const TextStyle(color: Colors.black45, fontSize: 16),
        suffixIcon: IconButton(
          icon: Icon(_isHidden ? Icons.visibility_off : Icons.visibility),
          onPressed: _toggleVisibility,
        ),
      ),
    );
  }
}
