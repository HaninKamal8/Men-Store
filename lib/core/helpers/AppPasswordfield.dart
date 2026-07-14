import 'package:flutter/material.dart';

class AppPasswordField extends StatelessWidget {
  const AppPasswordField({
    super.key,
    required this.controller,
    required this.hint,
    required this.obscureText,
    required this.suffix,
    required this.onPressed,
  });

  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  final IconData suffix;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Color(0xff3D6DCC),
            width: 1.5,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(
            suffix,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}