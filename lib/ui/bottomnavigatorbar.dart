import 'package:flutter/material.dart';
import 'package:petshop/ui/profile.dart';

import 'add.dart';
import 'chat.dart';
import 'favourite.dart';
import 'home.dart';

class bnb extends StatefulWidget {
  const bnb({super.key});

  @override
  State<bnb> createState() => _bnbState();
}

int currentIndex = 0;
final screens = [
  home(),
  const add(),
  const favourite(),
  const profile()
];

class _bnbState extends State<bnb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Color(0xff0E697C),
          unselectedItemColor: Color(0xff79747E),
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              print(currentIndex);
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/home.png")),
              backgroundColor: Colors.black,
              label: "home",
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/chat.png")),
                backgroundColor: Colors.black,
                label: "chat"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/heart.png")),
                backgroundColor: Colors.black,
                label: "favourite"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/profile.png"),
                ),
                backgroundColor: Colors.black,
                label: "profile"),
          ]),
      body: screens[currentIndex],
    );
  }
}
