import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_clone/util/utils.dart';

class Authmethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebasestore = FirebaseFirestore.instance;

  Stream<User?> get authchanges => _auth.authStateChanges();
  User get user => _auth.currentUser!;
  
  Future<bool> signinwithgoogle(BuildContext context) async {
    bool res = false;
    try {
      final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleauth =
          await googleuser?.authentication;
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleauth?.idToken,
        idToken: googleauth?.idToken,
      );
      UserCredential usercredential =
          await _auth.signInWithCredential(credentials);

      User? user = usercredential.user;

      if (user != null) {
        if (usercredential.additionalUserInfo!.isNewUser) {
          await _firebasestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilephoto': user.photoURL,
          });
        }
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      res = false;
    }
    return res;
  }
  void signout() async{
    try{
      _auth.signOut(); 
    }catch(e){
      print(e);
    }
  }
}
