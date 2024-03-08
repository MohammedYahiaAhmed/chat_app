import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBotton extends StatelessWidget {
  CustomBotton({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
