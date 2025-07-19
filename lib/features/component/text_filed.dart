import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final String label;
  final Function(String) onChanged;
  final bool isPhone;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.label,
    required this.onChanged,
    this.isPhone = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType:
          (widget.isPhone == true) ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: widget.hintText,
        prefixIcon: Icon(
          widget.icon,
          color: Theme.of(context).colorScheme.scrim,
        ),
        label: Text(widget.label),
        hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
        labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
      ),
      onChanged: widget.onChanged,
      style: TextStyle(
        color: Theme.of(context).colorScheme.scrim,
        fontSize: 16,
      ),

      obscureText: false,
    );
  }
}

class CustomPasswordTextField extends StatefulWidget {
  final void Function(String)? onChanged;
  final String hint;

  const CustomPasswordTextField({
    super.key,
    this.onChanged,
    this.hint = "Enter Password",
  });

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
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
      style: TextStyle(
        color: Theme.of(context).colorScheme.scrim,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: "****************",
        prefixIcon: Icon(
          Icons.password,
          color: Theme.of(context).colorScheme.scrim,
        ),
        labelText: widget.hint,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
        suffixIcon: IconButton(
          icon: Icon(_isHidden ? Icons.visibility_off : Icons.visibility),
          color: Theme.of(context).colorScheme.scrim,
          onPressed: _toggleVisibility,
        ),
        labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
      ),
    );
  }
}
