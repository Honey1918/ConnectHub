//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_method.dart';
import 'package:zoom_clone/screens/history_meeting.dart';
import 'package:zoom_clone/screens/meetingscreen.dart';
//import 'package:zoom_clone/screens/home_meeting.dart';
import 'package:zoom_clone/util/colors.dart';
import 'package:zoom_clone/widget/custom_but.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  //final Authmethods _authmethods= Authmethods();
  int _page = 0;
  ontapchanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> page = [
    Meetingscreen(),
    const HistoryMeeting(),
    const Text('Contacts'),
    Custombuttons(
        text: 'Log Out',
        onPressed: () {
          Authmethods().signout();
        })
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text("Meet & Chat"),
      ),
      body: page[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _page,
        onTap: ontapchanged,
        //unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.comment_bank,
              ),
              label: 'Meet & Chat'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.lock_clock,
              ),
              label: 'Meetings'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: 'Contacts'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
              ),
              label: 'Settings'),
        ],
      ),
    );
  }
}
