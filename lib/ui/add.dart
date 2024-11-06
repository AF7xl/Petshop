import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../toastmessage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
}

class add extends StatefulWidget {
  const add({super.key});

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  TextEditingController img = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController breed = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController phone = TextEditingController();
  final firestore = FirebaseFirestore.instance.collection('Post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ADD",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Enter URL of image"),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Container(
                width: 300,
                height: 55,
                color: Color(0xffE8F1F3),
                child: TextFormField(
                  decoration: InputDecoration(border: InputBorder.none),
                  controller: img,
                ),
              ),
            ),
            Text("Enter name"),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Container(
                width: 300,
                height: 55,
                color: Color(0xffE8F1F3),
                child: TextFormField(
                  decoration: InputDecoration(border: InputBorder.none),
                  controller: name,
                ),
              ),
            ),
            Text("Enter place"),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Container(
                width: 300,
                height: 55,
                color: Color(0xffE8F1F3),
                child: TextFormField(
                  decoration: InputDecoration(border: InputBorder.none),
                  controller: place,
                ),
              ),
            ),
            Text("Enter age"),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Container(
                width: 300,
                height: 55,
                color: Color(0xffE8F1F3),
                child: TextFormField(
                  decoration: InputDecoration(border: InputBorder.none),
                  controller: age,
                ),
              ),
            ),
            Text("Enter breed"),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Container(
                width: 300,
                height: 55,
                color: Color(0xffE8F1F3),
                child: TextFormField(
                  decoration: InputDecoration(border: InputBorder.none),
                  controller: breed,
                ),
              ),
            ),
            Text("Enter weight"),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Container(
                width: 300,
                height: 55,
                color: Color(0xffE8F1F3),
                child: TextFormField(
                  decoration: InputDecoration(border: InputBorder.none),
                  controller: weight,
                ),
              ),
            ),
            Text("Enter description"),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Container(
                width: 300,
                height: 100,
                color: Color(0xffE8F1F3),
                child: TextFormField(
                  decoration: InputDecoration(border: InputBorder.none),
                  controller: description,
                ),
              ),
            ),
            Text("Enter phone number"),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Container(
                width: 300,
                height: 100,
                color: Color(0xffE8F1F3),
                child: TextFormField(
                  decoration: InputDecoration(border: InputBorder.none),
                  controller: phone,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: TextButton(
                onPressed: () {
                  final id = DateTime.now().microsecondsSinceEpoch.toString();
                  firestore
                      .doc(id)
                      .set({
                        'image': img.text,
                        'id': id,
                        'name': name.text,
                        "place": place.text,
                        "age": age.text,
                        "breed": breed.text,
                        "weight": weight.text,
                        "description": description.text,
                        "phone": phone.text
                      })
                      .then((value) =>
                          {ToastMessage().toastmessage(message: 'Post Added')})
                      .onError((error, stackTrace) => ToastMessage()
                          .toastmessage(message: error.toString()));
                },
                child: Container(
                  width: 210,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Color(0xff0E697C)),
                  child: Center(
                    child: Text(
                      "ADD",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
