import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../toastmessage.dart';

class forgetpassword extends StatefulWidget {
  const forgetpassword({super.key});

  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword> {
  TextEditingController email = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password "),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25, left: 15),
            child: Text(
              "Enter your registered email",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 65, left: 45),
            child: Container(
                width: 310,
                height: 55,
                color: Colors.grey,
                child: Center(
                    child: TextFormField(
                  controller: email,
                ))),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25, left: 110),
            child: TextButton(
              onPressed: () {
                auth.sendPasswordResetEmail(email: email.text).then((value) {
                  ToastMessage()
                      .toastmessage(message: 'password changed successfully');
                }).onError((error, stackTrace) {
                  ToastMessage().toastmessage(message: error.toString());
                });
              },
              child: Container(
                width: 110,
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(35)),
                child: Center(
                  child: Text(
                    "Verify",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
