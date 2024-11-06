import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petshop/ui/productpage.dart';

class home extends StatefulWidget {


  home({
    super.key,

  });

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final firestore = FirebaseFirestore.instance.collection('Post').snapshots();
  final ref = FirebaseFirestore.instance.collection('Post');
  final firestor= FirebaseFirestore.instance.collection('profile').snapshots();
  final re= FirebaseFirestore.instance.collection('profile');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40, left: 20),
            child: StreamBuilder<QuerySnapshot>(
                stream: firestor,
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
                    return Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(snapshot
                              .data!.docs[0]['image']
                              .toString()),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 70),
                              child: Text(
                                "Hi, ${snapshot
                                    .data!.docs[0]['username']
                                    .toString()}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Discover your new friend",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 14),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xff95BDC6),
                            child: Icon(
                              Icons.search,
                              size: 30,
                              color: Color(0xff0E697C),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xff95BDC6),
                            child: Icon(
                              Icons.notifications_none_outlined,
                              size: 30,
                              color: Color(0xff0E697C),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return SizedBox();
                  }
                }
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5, top: 20),
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
                    return GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3.5 / 5,
                      shrinkWrap: true,
                      children: List.generate(
                        snapshot.data!.docs.length,
                            (index) {
                          return Card(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) =>
                                        productpage(
                                          name: snapshot
                                              .data!.docs[index]['name']
                                              .toString(),
                                          description: snapshot
                                              .data!.docs[index]['description']
                                              .toString(),
                                          weight: snapshot
                                              .data!.docs[index]['weight']
                                              .toString(),
                                          breed: snapshot
                                              .data!.docs[index]['breed']
                                              .toString(),
                                          age: snapshot.data!.docs[index]['age']
                                              .toString(),
                                          place: snapshot
                                              .data!.docs[index]['place']
                                              .toString(),
                                          img: snapshot
                                              .data!.docs[index]['image']
                                              .toString(),
                                          phone: snapshot
                                              .data!.docs[index]['phone']
                                              .toString(),
                                          id: snapshot.data!.docs[index]['id']
                                              .toString(),
                                        )));
                              },
                              child: Container(
                                width: 183,
                                height: 253,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: Color(0xffE8F1F3)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 210,
                                      height: 180,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(18),
                                              topLeft: Radius.circular(18),
                                              bottomLeft: Radius.circular(18),
                                              bottomRight:
                                              Radius.circular(18))),
                                      child: Image.network(
                                        snapshot.data!.docs[index]['image']
                                            .toString(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.only(top: 15, left: 5),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 105,
                                            height: 20,
                                            child: Text(
                                              snapshot.data!.docs[index]['name']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 16,
                                                  color: Color(0xff000000)),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 40),
                                            child: Icon(
                                              Icons.favorite_outline_outlined,
                                              size: 20,
                                              color: Color(0xff0E697C),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5, left: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Adult',
                                            style: TextStyle(
                                              color: Color(0xFF7A7A7A),
                                              fontSize: 14,
                                              fontFamily: 'Space Grotesk',
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 5, bottom: 3),
                                            child: Text(
                                              "|",
                                              style: TextStyle(
                                                  color: Color(0xff7A7A7A)),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(
                                              snapshot
                                                  .data!.docs[index]['place']
                                                  .toString(),
                                              style: TextStyle(
                                                color: Color(0xFF7A7A7A),
                                                fontSize: 14,
                                                fontFamily: 'Space Grotesk',
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                }),
          )
        ],
      ),
    );
  }
}
