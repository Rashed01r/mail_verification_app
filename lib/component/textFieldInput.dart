import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final Widget? icon;
  final String? Function(String?)? validator;

  const TextFieldInput(
      {super.key,
      required this.controller,
      this.isPass = false,
      required this.hintText,
      required this.textInputType,
      required this.icon,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(8),
        prefixIcon: icon,
        fillColor: Colors.white,
      ),
      keyboardType: textInputType,
      obscureText: isPass,
      textAlignVertical: TextAlignVertical.center,
    );
  }
}
