import 'package:chat_app/screens/login.dart';
import 'package:chat_app/screens/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatAPP());
}

class ChatAPP extends StatelessWidget {
  const ChatAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'Login': (context) => const Login(),
        Register.id: (context) => const Register(),
      },
      initialRoute: 'Login',
    );
  }
}
