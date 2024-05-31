import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/auth_method.dart';
import 'package:zoom_clone/resources/jitsi_meet.dart';
import 'package:zoom_clone/util/colors.dart';
import 'package:zoom_clone/widget/meeting_option.dart';

class VideoCall extends StatefulWidget {
  const VideoCall({super.key});

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  final Authmethods _authmethods = Authmethods();
  TextEditingController meetingIdcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  bool isaudiomute = true;
  bool isvideomute = true;
  final JitsiNewmeeting _jitsiNewmeeting = JitsiNewmeeting();

  @override
  void initState() {
    meetingIdcontroller = TextEditingController();
    namecontroller = TextEditingController(text: _authmethods.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdcontroller.dispose();
    namecontroller.dispose();
    JitsiMeet.removeAllListeners();
  }

  onaudiomuted(bool val) {
    setState(() {
      isaudiomute = val;
    });
  }

  onvideomuted(bool val) {
    setState(() {
      isvideomute = val;
    });
  }

  _joinmeeting() {
    _jitsiNewmeeting.createnewMeeting(
        roomname: meetingIdcontroller.text,
        isAudioMuted: isaudiomute,
        isVideoMuted: isvideomute,
        username: namecontroller.text
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Join a meeting',
            style: TextStyle(fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 60,
              child: TextField(
                controller: meetingIdcontroller,
                maxLines: 1,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    fillColor: secondaryBackgroundColor,
                    filled: true,
                    border: InputBorder.none,
                    hintText: "Room ID",
                    contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 8)),
              ),
            ),
            SizedBox(
              height: 60,
              child: TextField(
                controller: namecontroller,
                maxLines: 1,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    fillColor: secondaryBackgroundColor,
                    filled: true,
                    border: InputBorder.none,
                    hintText: "Name",
                    contentPadding: EdgeInsets.fromLTRB(8, 8, 0, 10)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: _joinmeeting,
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Join',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MeetingOption(
              text: 'Mute Audio',
              ismute: isaudiomute,
              onchange: onaudiomuted,
            ),
            MeetingOption(
              text: 'Turn Off My Video',
              ismute: isvideomute,
              onchange: onvideomuted,
            ),
          ],
        ));
  }
}
