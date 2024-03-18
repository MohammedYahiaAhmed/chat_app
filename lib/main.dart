import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/login.dart';
import 'package:chat_app/screens/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatAPP());
}

class ChatAPP extends StatelessWidget {
  const ChatAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Login.id: (context) => Login(),
        Register.id: (context) => Register(),
        ChatScreen.id: (context) => ChatScreen(),
      },
      initialRoute: Login.id,
    );
  }
}
