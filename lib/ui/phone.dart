import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../toastmessage.dart';
import 'otp.dart';


class phone extends StatefulWidget {
  const phone({super.key});

  @override
  State<phone> createState() => _phoneState();
}

class _phoneState extends State<phone> {
  TextEditingController phone = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Phone number"),),
      body: Center(
        child: Column(
          children: [SizedBox(height: 180,),
            Container(
                width: 300,
                height: 55,color: Colors.grey,
                child: Center(
                    child: TextFormField(
                      controller: phone,
                    ))),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: GestureDetector(onTap: (){
                auth.verifyPhoneNumber(phoneNumber: phone.text,verificationCompleted: (_){},
                    verificationFailed: (e){
                      ToastMessage().toastmessage(message: e.toString());
                    },
                    codeSent: (String verificationId,int? token){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext a)=>otp(verificationId: verificationId,)));

                    },
                    codeAutoRetrievalTimeout: (e){
                      ToastMessage().toastmessage(message: e.toString());
                    });
              },
                child: Text(
                  "Get OTP",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
