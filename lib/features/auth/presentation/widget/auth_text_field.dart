import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  });
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      obscureText: obscureText,
    );
  }
}
