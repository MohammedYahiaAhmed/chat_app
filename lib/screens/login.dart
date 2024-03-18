// import 'package:chat_app/screens/register.dart';
// ignore_for_file: use_build_context_synchronously, unused_local_variable, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:chat_app/constans.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/register.dart';
import 'package:chat_app/widgets/custom_botton.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({super.key});

  static String id = 'login';
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  String? email, password;

  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                kImage,
                height: 100,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    kTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Row(
                children: [
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                prefix: Icons.email,
                onChanged: (data) {
                  email = data;
                },
                labelText: 'Enter Your Email',
              ),
              const SizedBox(
                height: 14,
              ),
              CustomTextFormField(
                prefix: Icons.lock,
                sufix: isPassword ? Icons.visibility_off : Icons.visibility,
                isPassword: isPassword,
                suffixPressed: () {
                  setState(() {
                    isPassword = !isPassword;
                  });
                },
                onChanged: (data) {
                  password = data;
                },
                labelText: 'Enter Your Password',
              ),
              const SizedBox(
                height: 24,
              ),
              CustomBotton(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    try {
                      await loginUser();
                      Navigator.pushNamed(context, ChatScreen.id,
                          arguments: email);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showSnackBar(context, 'No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        showSnackBar(
                            context, 'Wrong password provided for that user.');
                      }
                    } catch (e) {
                      showSnackBar(context, 'there was an error');
                    }
                    isLoading = false;
                    setState(() {});
                  }
                },
                text: 'Login',
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'don\'t have an account ?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Register.id);
                    },
                    child: const Text(
                      ' Register',
                      style: TextStyle(
                        color: Color(
                          0xffC7EDE6,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
