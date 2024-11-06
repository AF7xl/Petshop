import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petshop/ui/bottomnavigatorbar.dart';

class google extends StatefulWidget {
  const google({super.key});

  @override
  State<google> createState() => _googleState();
}

Future<User?> signInWithGoogle({required BuildContext context}) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    try {
      final UserCredential userCredential =
      await auth.signInWithCredential(credential);

      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
// handle the error here
      } else if (e.code == 'invalid-credential') {
// handle the error here
      }
    } catch (e) {
// handle the error here
    }
  }

  return user;
}

class _googleState extends State<google> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Verification"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 110, left: 65),
            child: GestureDetector(onTap: (){
              signInWithGoogle(context: context);
            },
              child: Container(
                width: 210,
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.black),
                child: Center(
                    child: Text(
                      "verify",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
