import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petshop/ui/bottomnavigatorbar.dart';
import 'package:petshop/ui/home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp/whatsapp.dart';
import 'package:whatsapp_share/whatsapp_share.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../toastmessage.dart';

class productpage extends StatefulWidget {
  String img;
  String name;
  String place;
  String age;
  String breed;
  String weight;
  String description;
  String phone;
  String id;

  productpage(
      {super.key,
      required this.name,
      required this.description,
      required this.weight,
      required this.breed,
      required this.age,
      required this.place,
      required this.img,
      required this.phone,required this.id});

  @override
  State<productpage> createState() => _productpageState();
}

class _productpageState extends State<productpage> {
  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+91${widget.phone}',
      text: "Hey! I'm inquiring about the pet",
    );
    await launch('$link');
  }

  final firestore = FirebaseFirestore.instance.collection('favourite');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              CarouselSlider.builder(
                itemCount: 15,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: Image.network(
                    widget.img,
                    fit: BoxFit.cover,
                  ),
                ),
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  aspectRatio: 0.95,
                  initialPage: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => bnb()));
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                        color: Color(0xff0E697C),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 230),
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
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 360, left: 330),
                child: TextButton(
                  onPressed: () {
                    final id = DateTime.now().microsecondsSinceEpoch.toString();
                    firestore
                        .doc(id)
                        .set({
                          'image': widget.img,
                          'name': widget.name,
                          "age": widget.age,
                          "breed": widget.breed,
                          "weight": widget.weight,
                      "id":id
                        })
                        .then((value) => {
                              ToastMessage().toastmessage(message: 'Added to favourites')
                            })
                        .onError((error, stackTrace) => ToastMessage()
                            .toastmessage(message: error.toString()));
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xff95BDC6),
                    child: Icon(
                      Icons.favorite_border,
                      size: 30,
                      color: Color(0xff0E697C),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 100, top: 5),
            child: Text(
              widget.name,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Color(0xff005162)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 35),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 25,
                  color: Color(0xff7DAEB8),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    widget.place,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: Color(0xff7DAEB8)),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Container(
                    width: 128,
                    height: 68,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Color(0x3895BDC6)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'Age',
                            style: TextStyle(
                              color: Color(0xFF6A6969),
                              fontSize: 12,
                              fontFamily: 'Space Grotesk',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            widget.age,
                            style: TextStyle(
                              color: Color(0xFF0E697C),
                              fontSize: 16,
                              fontFamily: 'Space Grotesk',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Container(
                    width: 108,
                    height: 68,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Color(0x3895BDC6)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'Breed',
                            style: TextStyle(
                              color: Color(0xFF6A6969),
                              fontSize: 12,
                              fontFamily: 'Space Grotesk',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            widget.breed,
                            style: TextStyle(
                              color: Color(0xFF0E697C),
                              fontSize: 16,
                              fontFamily: 'Space Grotesk',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Container(
                    width: 108,
                    height: 68,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Color(0x3895BDC6)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'Weight',
                            style: TextStyle(
                              color: Color(0xFF6A6969),
                              fontSize: 12,
                              fontFamily: 'Space Grotesk',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            widget.weight,
                            style: TextStyle(
                              color: Color(0xFF0E697C),
                              fontSize: 16,
                              fontFamily: 'Space Grotesk',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Container(
              width: 369,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color(0xffF5F5F5)),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Container(
                          width: 74,
                          height: 74,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18)),
                          child: Image.asset(
                            "assets/owner.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Petter Parker",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Color(0xff0E697C)),
                            ),
                            Text(
                              "Pet Owner",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: Color(0xff7A7A7A)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 35),
                        child: IconButton(
                            onPressed: launchWhatsApp,
                            icon: FaIcon(
                              FontAwesomeIcons.whatsapp,
                              size: 30,
                              color: Color(0xff0E697C),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 1),
                        child: TextButton(
                          onPressed: () {
                            launchUrlString("tel:+91${widget.phone}");
                          },
                          child: Container(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                "assets/call.png",
                                fit: BoxFit.cover,
                              )),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 20),
            child: SizedBox(
              width: 369,
              height: 88,
              child: Text(
                widget.description,
                style: TextStyle(
                  color: Color(0xFF484646),
                  fontSize: 14,
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Container(
              width: 362,
              height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Color(0xff0E697C)),
              child: Center(
                child: Text(
                  'Message',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Space Grotesk',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
