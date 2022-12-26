import 'package:flutter/material.dart';

Image logoWidget(String image) {
  return Image.asset(image, fit: BoxFit.cover, width: 150, height: 150);
}

TextField textBox(String text, IconData icon, bool password,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: password,
    cursorColor: Colors.white,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: const TextStyle(color: Colors.white),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.black,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
    ),
  );
}

Container newButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: 200,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.redAccent;
          }
          return Colors.black;
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
  );
}

customAlert(BuildContext context, String text) {
  Widget okButton = TextButton(
    onPressed: () {
      Navigator.pop(context);
    },
    child: const Text("OK"),
  );
  AlertDialog alert = AlertDialog(
    title: const Text("Attention"),
    content: Text(text),
    actions: [okButton],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
