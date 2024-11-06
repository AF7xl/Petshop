import 'package:flutter/material.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(
              width: 20,
              height: 20,
              child: Icon(
                Icons.arrow_back_ios,
                color: Color(0xff0E697C),
              )),
          title: Center(
            child: Text(
              'Messages',
              style: TextStyle(
                color: Color(0xFF0E697C),
                fontSize: 24,
                fontFamily: 'Space Grotesk',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          actions: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xff95BDC6),
              child: Icon(
                Icons.notifications_none_outlined,
                size: 30,
                color: Color(0xff0E697C),
              ),
            )
          ],
        ),
        body: ListView.separated(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Container(
                width: 361,
                height: 70,
                color: Colors.white,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      child: Image.asset(
                        "assets/round.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Petter Parker',
                            style: TextStyle(
                              color: Color(0xFF0E697C),
                              fontSize: 16,
                              fontFamily: 'Space Grotesk',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Hello',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Space Grotesk',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 80, top: 30),
                      child: Text(
                        '5 min',
                        style: TextStyle(
                          color: Color(0xFF7A7A7A),
                          fontSize: 12,
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Color(0xffD9D9D9),
              indent: 65,
              endIndent: 65,
            );
          },
        ));
  }
}
