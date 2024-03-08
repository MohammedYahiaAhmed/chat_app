// import 'package:chat_app/screens/register.dart';
import 'package:chat_app/constans.dart';
import 'package:chat_app/screens/register.dart';
import 'package:chat_app/widgets/custom_botton.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/scholar.png',
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Scholar Chat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Pacifico',
                  ),
                ),
              ],
            ),
            SizedBox(
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
            CustomTextField(
              labelText: 'Enter Your Email',
            ),
            const SizedBox(
              height: 14,
            ),
            CustomTextField(
              labelText: 'Enter Your Password',
            ),
            const SizedBox(
              height: 24,
            ),
            CustomBotton(
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
    );
  }
}
