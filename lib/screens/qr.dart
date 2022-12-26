import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              logoWidget("images/koç_logo.png"),
              const SizedBox(
                height: 30,
              ),
              newButton(context, "QR-Code Reader", () {}),
              const SizedBox(
                height: 30,
              ),
              newButton(context, "Logout", () {
                FirebaseAuth.instance
                    .signOut()
                    .then((value) => Navigator.pop(context));
              })
            ],
          ),
        ),
      ),
    );
  }
}
