import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  String url = "";

  void scanQrCode() {
    FlutterBarcodeScanner.scanBarcode("#FF0000", "Cancel", false, ScanMode.QR)
        .then((value) {
      setState(() {
        url = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    scanQrCode();
  }

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
              newButton(context, "Scan qr", () async {
                scanQrCode();
              }),
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
