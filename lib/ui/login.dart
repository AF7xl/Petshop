import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petshop/ui/bottomnavigatorbar.dart';
import 'package:petshop/ui/forgotpassword.dart';
import 'package:petshop/ui/google.dart';
import 'package:petshop/ui/phone.dart';
import 'package:petshop/ui/signin.dart';

import '../toastmessage.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool passwordObscured = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 300, top: 20),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => bnb()));
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            color: Color(0xffA0A0A0),
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: SizedBox(
                        width: 5.91,
                        height: 13.2,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) => bnb()));
                          },
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xffA0A0A0),
                          ),
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25, left: 10),
              child: SizedBox(
                  width: 237,
                  height: 250.83,
                  child: Image.asset("assets/logo1.png")),
            ),
            Padding(
              padding: EdgeInsets.only(top: 13),
              child: Text(
                "Time to spread your love",
                style: TextStyle(
                    color: Color(0xff090909),
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                    fontFamily: "Space Grotesk"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text("Sign In",
                  style: TextStyle(
                      fontFamily: "Space Grotesk",
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff0E697C))),
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
              padding: EdgeInsets.only(left: 180, top: 5),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => forgetpassword()));
                },
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Color(0xffA0A0A0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, right: 10),
              child: TextButton(
                onPressed: () {
                  auth
                      .signInWithEmailAndPassword(
                          email: username.text, password: password.text)
                      .then((value) => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext a) => bnb()))
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
                    "LOG IN",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, right: 10),
              child: Text(
                "Or Sign up using",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: Color(0xffA0A0A0)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 150),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => google()));
                      },
                      child: SizedBox(
                          width: 37,
                          height: 37,
                          child: Image.asset("assets/googl.png")),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => phone()));
                      },
                      child: SizedBox(
                          width: 23,
                          height: 23,
                          child: Image.asset("assets/phone.png")),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 90),
              child: Row(
                children: [
                  Text(
                    "Don’t have an account?",
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
                            .push(MaterialPageRoute(builder: (_) => signin()));
                      },
                      child: Text(
                        "Create",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xff0E697C)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
