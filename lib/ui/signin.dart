import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petshop/ui/login.dart';

import '../toastmessage.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  bool passwordObscured = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 350, top: 20),
              child: SizedBox(
                  width: 5.91,
                  height: 13.2,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => login()));
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xffA0A0A0),
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 35),
              child: SizedBox(
                  width: 240.32,
                  height: 250.83,
                  child: Image.asset("assets/logo2.png")),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "Create Your Account",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff0E697C)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Card(
                color: Color(0xffFFFFFF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                child: Container(
                  width: 320,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: username,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Color(0xff0E697C)),
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: Color(0xff0E697C),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 3),
                        border: InputBorder.none,
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "User name",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: Color(0xff7DAEB8)),
                        prefixIcon: Icon(
                          CupertinoIcons.profile_circled,
                          color: Color(0xff0E697C),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Card(
                color: Color(0xffFFFFFF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                child: Container(
                  width: 320,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: email,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Color(0xff0E697C)),
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: Color(0xff0E697C),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 3),
                        border: InputBorder.none,
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Email ID",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: Color(0xff7DAEB8)),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Color(0xff0E697C),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Card(
                color: Color(0xffFFFFFF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                child: Container(
                  width: 320,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      style: TextStyle(color: Color(0xff0E697C)),
                      controller: password,
                      obscureText: passwordObscured,
                      textAlign: TextAlign.start,
                      cursorColor: Color(0xff0E697C),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: "Password",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              color: Color(0xff7DAEB8)),
                          prefixIcon: Icon(
                            CupertinoIcons.lock,
                            color: Color(0xff0E697C),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordObscured = !passwordObscured;
                              });
                            },
                            icon: Icon(
                              Icons.visibility_off,
                              color: Color(0xff0E697C),
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, right: 10),
              child: TextButton(
                onPressed: () {
                  auth
                      .createUserWithEmailAndPassword(
                          email: email.text, password: password.text)
                      .then((value) => {
                            ToastMessage()
                                .toastmessage(message: 'Successfully registerd')
                          })
                      .onError((error, stackTrace) => ToastMessage()
                          .toastmessage(message: error.toString()));
                },
                child: Container(
                  width: 143,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Color(0xff0E697C)),
                  child: Center(
                      child: Text(
                    "SIGN UP",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 55, left: 90),
              child: Row(
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff484848)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => login()));
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xff0E697C)),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
