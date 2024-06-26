import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  const CustomInputField({
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}