// ignore_for_file: use_build_context_synchronously, prefer_const_constructors_in_immutables

import 'package:chat_app/constans.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/widgets/custom_botton.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class Register extends StatefulWidget {
  Register({
    super.key,
  });
  static String id = 'Register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? email, password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                      'REGISTER',
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
                  labelText: 'Email',
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
                  labelText: 'Password',
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
                        await registerUser();
                        Navigator.pop(context);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'week-password ') {
                          showSnackBar(context, 'week password');
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context, 'email already exists');
                        }
                      } catch (e) {
                        showSnackBar(context, 'there was an error');
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                  text: 'Register',
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'already have an account? ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        ' Login',
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
      ),
    );
  }

  Future<void> registerUser() async {
    // ignore: unused_local_variable
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
