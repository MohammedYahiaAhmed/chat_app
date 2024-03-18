import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBotton extends StatelessWidget {
  CustomBotton({super.key, required this.text, this.onTap});
  String text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
