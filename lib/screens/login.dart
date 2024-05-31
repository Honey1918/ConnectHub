import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_method.dart';
import 'package:zoom_clone/widget/custom_but.dart';


class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _Loginscreen();
}

class _Loginscreen extends State<Loginscreen> {
  final Authmethods _authmethods = Authmethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Start or join a meeting',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Image.asset('assets/onboarding.jpg'),
          ),
          Custombuttons(
            text: 'Google Sign in',
            onPressed: () async {
              bool res = await _authmethods.signinwithgoogle(context);
              if(res){
                Navigator.pushNamed(context, '/home');
              }
            },
            
          ),
        ],
      ),
    );
  }
}
