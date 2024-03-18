// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.labelText,
    this.onChanged,
    required this.prefix,
    this.sufix,
    this.isPassword = false,
    this.suffixPressed,
  });
  String? labelText;
  Function(String)? onChanged;
  IconData prefix;
  IconData? sufix;
  bool isPassword;
  Function()? suffixPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return "Field is Required";
        }
      },
      obscureText: isPassword,
      onChanged: onChanged,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(prefix, color: Colors.white),
        suffixIcon: sufix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  sufix,
                  color: Colors.white,
                ),
              )
            : null,
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
