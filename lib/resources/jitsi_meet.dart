//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
// import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
// import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/auth_method.dart';
import 'package:zoom_clone/resources/firestoremethods.dart';

class JitsiNewmeeting {
  final Authmethods _authmethod = Authmethods();
  final Firestoremethods _firebasestore= Firestoremethods();
  void createnewMeeting(
      {required String roomname,
      required bool isAudioMuted,
      required bool isVideoMuted,
      String username=''
      }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION;

      String name;
      if(username.isEmpty){
        name= _authmethod.user.displayName!;
      }
      else{
        name=username;
      }
      var options = JitsiMeetingOptions(room: roomname)
        ..userDisplayName = name
        ..userEmail = _authmethod.user.email
        ..userAvatarURL = _authmethod.user.photoURL
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      await  JitsiMeet.joinMeeting(options);
      _firebasestore.addToMeetingHistory(roomname);
    } catch (error) {
      //print("error: $error");
    }
  }
}
