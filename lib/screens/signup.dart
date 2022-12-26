import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: <Widget>[
              logoWidget("images/koç_logo.png"),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              textBox("Enter new e-mail", Icons.person_outline, false,
                  emailController),
              const SizedBox(
                height: 30,
              ),
              textBox(
                  "Enter new password", Icons.lock, true, passwordController),
              const SizedBox(
                height: 10,
              ),
              newButton(
                context,
                "Sign up ",
                () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text)
                      .then((value) {
                    Navigator.pop(context);
                  }).onError((error, stackTrace) {
                    customAlert(context, "error ${error.toString()}");
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
