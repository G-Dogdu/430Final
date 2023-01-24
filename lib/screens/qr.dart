import 'package:data_priv/screens/result.dart';
import 'package:data_priv/url.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

CurrentUrl url = CurrentUrl("");

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
              newButton(context, "Scan qr", () {
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

  Future scanQrCode() async {
    String? scanResult;
    try {
      scanResult = (await FlutterBarcodeScanner.scanBarcode(
          "#FF0000", "Cancel", false, ScanMode.QR));
    } on PlatformException {
      customAlert(context, "platform exception error");
    }
    if (mounted) {
      if (scanResult == "-1") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const QrScreen()));
      } else {
        url.setUrl(scanResult!);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Results()));
      }
    }
  }
}
