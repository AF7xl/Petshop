import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class favourite extends StatefulWidget {
  const favourite({super.key});

  @override
  State<favourite> createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
  final firestore =
      FirebaseFirestore.instance.collection('favourite').snapshots();
  final ref = FirebaseFirestore.instance.collection('favourite');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 70),
          child: Text(
            "Favourites",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: Color(0xff0E697C)),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 5),
        child: StreamBuilder<QuerySnapshot>(
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
                return ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 190,
                      height: 150,
                      color: Color(0xff95BDC6),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 180,
                              height: 180,
                              child: Image.network(
                                snapshot.data!.docs[index]['image'].toString(),
                                fit: BoxFit.cover,
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 150),
                                child: IconButton(
                                  onPressed: () {
                                    ref
                                        .doc(snapshot.data!.docs[index]['id']
                                            .toString())
                                        .delete();
                                  },
                                  icon: Icon(
                                    Icons.cancel_outlined,
                                    size: 15,
                                    color: Color(0xff0E697C),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Name :",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF005061)),
                                    ),
                                    SizedBox(
                                      width: 135,
                                      height: 20,
                                      child: Text(
                                        snapshot.data!.docs[index]['name']
                                            .toString(),
                                        style: TextStyle(
                                          color: Color(0xFF005061),
                                          fontSize: 12,
                                          fontFamily: 'Space Grotesk',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10, top: 3),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Age :",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF005061)),
                                    ),
                                    SizedBox(
                                      width: 135,
                                      height: 20,
                                      child: Text(
                                        snapshot.data!.docs[index]['age']
                                            .toString(),
                                        style: TextStyle(
                                          color: Color(0xFF005061),
                                          fontSize: 12,
                                          fontFamily: 'Space Grotesk',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3, left: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Breed :",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF005061)),
                                    ),
                                    SizedBox(
                                      width: 135,
                                      height: 20,
                                      child: Text(
                                        snapshot.data!.docs[index]['breed']
                                            .toString(),
                                        style: TextStyle(
                                          color: Color(0xFF005061),
                                          fontSize: 12,
                                          fontFamily: 'Space Grotesk',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10, top: 3),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Weight :",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF005061)),
                                    ),
                                    SizedBox(
                                      width: 135,
                                      height: 20,
                                      child: Text(
                                        snapshot.data!.docs[index]['weight']
                                            .toString(),
                                        style: TextStyle(
                                          color: Color(0xFF005061),
                                          fontSize: 12,
                                          fontFamily: 'Space Grotesk',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 25,
                    );
                  },
                );
              } else {
                return SizedBox();
              }
            }),
      ),
    );
  }
}
