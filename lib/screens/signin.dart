import 'package:data_priv/screens/forget.dart';
import 'package:data_priv/screens/qr.dart';
import 'package:data_priv/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
              const Text(
                "Comp 430 QR-Code Scanner",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 30,
              ),
              textBox("E-mail", Icons.person_outline, false, emailController),
              const SizedBox(
                height: 30,
              ),
              textBox("Password", Icons.lock, true, passwordController),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Forget(),
                    ),
                  );
                },
                child: const Text(
                  "Forget Password ?",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ),
                  );
                },
                child: const Text(
                  "Don't have an acount ?",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              newButton(context, "Sign in ", () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text)
                    .then(
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QrScreen()),
                      ),
                    )
                    .onError((error, stackTrace) =>
                        customAlert(context, error.toString()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
