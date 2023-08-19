import 'package:flutter/material.dart';

class TextFieldInputPass extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final Widget? icon;

  const TextFieldInputPass({
    super.key,
    required this.controller,
    required this.hintText,
    required this.textInputType,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    bool _isVisible = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return TextFormField(
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              icon: _isVisible
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
            ),
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
          obscureText: !_isVisible,
          textAlignVertical: TextAlignVertical.center,
        );
      },
    );
  }
}
