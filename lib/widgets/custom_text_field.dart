import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final double width;

  final TextEditingController controller;
  final bool isPassword;
  final String hint;
  final TextInputType textInputType;

  const CustomTextField({
    super.key,
    required this.width,
    required this.controller,
    required this.isPassword,
    required this.hint,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );

    return SizedBox(
      width: 240,
      height: 35,
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 10, 2, 23),
          filled: true,
          hintText: hint,
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
        ),
        style: const TextStyle(fontSize: 10),
      ),
    );
  }
}
