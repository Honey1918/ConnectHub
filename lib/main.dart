import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_method.dart';
import 'package:zoom_clone/screens/homescreen.dart';
import 'package:zoom_clone/screens/login.dart';
import 'package:zoom_clone/screens/video_callscreen.dart';
import 'package:zoom_clone/util/colors.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ConnectHub',
      theme: ThemeData.dark(useMaterial3: true)
          .copyWith(scaffoldBackgroundColor: backgroundColor),
      routes: {
        '/login':(context)=>const Loginscreen(),
        '/home' :(context)=>const Homescreen(),
        '/videocall':(context)=>const VideoCall(),
      },
      //for persisting the state,
      home: StreamBuilder(stream: Authmethods().authchanges,
      builder: (context, snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }
        if(snapshot.hasData){
          return const Homescreen();
        }
        return const Loginscreen();
      }
      ),
    );
  }
}
