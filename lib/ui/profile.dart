import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'edit profite.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final firestore =
      FirebaseFirestore.instance.collection('profile').snapshots();
  final ref = FirebaseFirestore.instance.collection('profile');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: firestore,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text(
                'error',
                style: TextStyle(color: Colors.purple),
              );
            }
            if (snapshot.hasData) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(200),
                              bottomRight: Radius.circular(200)),
                          color: Color(0xB2D6F3EF),
                          shape: BoxShape.rectangle,
                        ),
                        height: 250,
                        width: 426,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 150, left: 115),
                        child: Container(
                          width: 155,
                          height: 155,
                          decoration: ShapeDecoration(
                            color: Color(0xFF40C8B6),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 162, left: 128),
                        child: CircleAvatar(
                          radius: 65,
                          backgroundImage: NetworkImage(
                              snapshot.data!.docs[0]['image'].toString()),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      snapshot.data!.docs[0]['username'].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: Color(0xff000000),
                          fontFamily: "Space Grotesk"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 45),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: SizedBox(
                              width: 24,
                              height: 24,
                              child: Icon(CupertinoIcons.profile_circled,
                                  color: Color(0xff000000))),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 35, top: 42),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => editprofile(id:  snapshot.data!.docs[0]['id'].toString(),)));
                            },
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 45),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: SizedBox(
                              width: 24,
                              height: 24,
                              child: Icon(Icons.notifications_none_rounded,
                                  color: Color(0xff000000))),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 35, top: 42),
                          child: Text(
                            "Notification",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 45),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: SizedBox(
                              width: 24,
                              height: 24,
                              child: Icon(Icons.settings_outlined,
                                  color: Color(0xff000000))),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 35, top: 42),
                          child: Text(
                            "Settings & Privacy",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 45),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: SizedBox(
                              width: 24,
                              height: 24,
                              child: Icon(Icons.support_agent_rounded,
                                  color: Color(0xff000000))),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 35, top: 42),
                          child: Text(
                            "Help & Support",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 45),
                    child: Container(
                      width: 227,
                      height: 52,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF00B69D)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            color: Color(0xFF40C8B6),
                            fontSize: 24,
                            fontFamily: 'Space Grotesk',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            } else {
              return SizedBox();
            }
          }),
    );
  }
}
