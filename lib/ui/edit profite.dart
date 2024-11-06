import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../toastmessage.dart';

class editprofile extends StatefulWidget {
  final String id;
  const editprofile({super.key,required this.id});

  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  TextEditingController username = TextEditingController();
  TextEditingController img = TextEditingController();
  TextEditingController uusername = TextEditingController();
  final firestore = FirebaseFirestore.instance.collection('profile');
  final ref = FirebaseFirestore.instance.collection('Post');

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 85),
          child: Text(
            "Edit Profile",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: Color(0xff0E697C)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "Username",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color(0xff0E697C)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 50),
              child: TextFormField(
                cursorColor: Color(0xff0E697C),
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                controller: username,
                decoration: InputDecoration(
                    hintText: "Enter Username",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: Color(0xff7DAEB8)),
                    suffixIcon: TextButton(
                      onPressed: () {
                        showModalBottomSheet(context: context, builder: (BuildContext Context){
                          return Container(
                            width: double.infinity,
                            height: 500,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                      "enter value to be updated"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Container(
                                      width: 220,
                                      height: 55,
                                      color: Colors.grey,
                                      child: TextFormField(
                                        controller:uusername ,
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20, left: 110),
                                  child: TextButton(onPressed: (){
                                    firestore.doc(widget.id)
                                        .update({
                                      'username':uusername.text,
                                    }).then((value) {
                                      ToastMessage().toastmessage(message: 'Updated Successfully');
                                      Navigator.of(context).pop();
                                    }).onError((error, stackTrace) {
                                      ToastMessage().toastmessage(message: error.toString());
                                    });
                                  },
                                    child: Container(
                                      width: 110,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(35),
                                          color: Colors.black),
                                      child: Center(
                                        child: Text(
                                          "Update",
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        } );
                      },
                      child: Icon(
                        Icons.edit,
                        size: 25,
                        color: Color(0xff7DAEB8),
                      ),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 20),
              child: Text(
                "Image",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color(0xff0E697C)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 50),
              child: TextFormField(
                cursorColor: Color(0xff0E697C),
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                controller: img,
                decoration: InputDecoration(
                    hintText: "Enter Image URL",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: Color(0xff7DAEB8)),
                    suffixIcon: Icon(
                      Icons.edit,
                      size: 25,
                      color: Color(0xff7DAEB8),
                    )),
              ),
            ),
            GestureDetector(
              onTap: () {
                final id = DateTime.now().microsecondsSinceEpoch.toString();
                firestore
                    .doc(id)
                    .set({
                      'username': username.text,
                      'id': id,
                      "image": img.text
                    })
                    .then((value) => {
                          ToastMessage().toastmessage(message: 'Profile Edited')
                        })
                    .onError((error, stackTrace) =>
                        ToastMessage().toastmessage(message: error.toString()));
              },
              child: Padding(
                padding: EdgeInsets.only(top: 410, left: 95),
                child: Container(
                  width: 210,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Color(0xff7DAEB8)),
                  child: Center(child: Text("Edit")),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
