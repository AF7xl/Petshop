import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';



import 'package:petshop/ui/bottomnavigatorbar.dart';

import '../toastmessage.dart';

class otp extends StatefulWidget {
  final verificationId;

  const otp({super.key, required this.verificationId});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 120,
          ),
          Text(
            "Verification",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: OtpTextField(
              numberOfFields: 6,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) async {
                final credentials = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: verificationCode);
                try {
                  await auth.signInWithCredential(credentials);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext a) => bnb()));
                } catch (e) {
                  ToastMessage().toastmessage(message: e.toString());
                }
              }, // end onSubmit
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 90),
            child: GestureDetector(
              onTap: () async {},
              child: Container(
                width: 150,
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.black),
                child: Center(
                  child: Text(
                    "confirm",
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
