import 'dart:math';
import 'package:flutter/material.dart';
//import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/jitsi_meet.dart';
import 'package:zoom_clone/screens/home_meeting.dart';

class Meetingscreen extends StatelessWidget {
  Meetingscreen({super.key});

  final JitsiNewmeeting _jitsiNewmeeting= JitsiNewmeeting();

  createnewMeeting(){
    var random= Random();
    String roomname = (random.nextInt(10000000) + 10000000).toString();
    _jitsiNewmeeting.createnewMeeting(
        roomname: roomname, isAudioMuted: true, isVideoMuted: true);
  }

  joinmeeting(BuildContext context){
    Navigator.pushNamed(context, '/videocall');
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Homemeeting(
              onPressed: createnewMeeting,
              text: "New Meeting",
              icon: Icons.videocam,
            ),
            Homemeeting(
              onPressed: ()=>joinmeeting(context),
              text: "Join Meeting",
              icon: Icons.add_box,
            ),
            Homemeeting(
              onPressed: () {},
              text: "scheduled",
              icon: Icons.calendar_today,
            ),
            Homemeeting(
              onPressed: () {},
              text: "Share screen",
              icon: Icons.arrow_upward_rounded,
            ),
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Create/Join meeting with just a click!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        )
      ],
    );
  }
}
