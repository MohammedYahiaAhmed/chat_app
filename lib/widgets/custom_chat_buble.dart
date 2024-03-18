import 'package:chat_app/constans.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

class CustomChatBuble extends StatelessWidget {
  const CustomChatBuble({
    super.key,
    required this.message,
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(14),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22),
            topRight: Radius.circular(22),
            bottomRight: Radius.circular(22),
          ),
          color: kPrimaryColor,
        ),
        child: Column(
          children: [
            Text(
              message.message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const Text(
              '',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomChatBubleFreind extends StatelessWidget {
  const CustomChatBubleFreind({
    super.key,
    required this.message,
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(14),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22),
            topRight: Radius.circular(22),
            bottomLeft: Radius.circular(22),
          ),
          color: Color(0xff006D84),
        ),
        child: Text(
          message.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
