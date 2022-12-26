import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

class Forget extends StatefulWidget {
  const Forget({Key? key}) : super(key: key);

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  TextEditingController emailController = TextEditingController();
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
              textBox(
                  "Enter e-mail", Icons.person_outline, false, emailController),
              const SizedBox(
                height: 30,
              ),
              newButton(
                context,
                "Send Reset Mail ",
                () {
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(email: emailController.text)
                      .then((value) => Navigator.of(context).pop());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
