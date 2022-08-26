import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/screens/home_page.dart';
import 'package:flutter_firebase_app/screens/login_page.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _fireBaseInit = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fireBaseInit,
      builder: (context, snapshot) {
        //context is current app and snapshot is received from database

        if (snapshot.hasError) {
          //for check setup purposes check for received snapshot on errors
          print("Error: ${snapshot.error}");
        }

        //connection is established and Firebase app is currently running
        if (snapshot.connectionState == ConnectionState.done) { //checking on complete
          //means that Firebase.initializeApp(); has no errors
          return StreamBuilder( //checking if user is logged in, instead of checking on each screen, check login state live
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, authSnapshot) {
              if (authSnapshot.hasError) {
                //for check setup purposes check for received snapshot on errors
                print("Error: ${authSnapshot.error}");
              }

              //FirebaseAuth.instance.authStateChanges() has no errors and user can be check in if()
              if (authSnapshot.connectionState == ConnectionState.active) { //checking during live. as StreamBuilder is used

                User _user = authSnapshot.data; //get user data, provide by firebase auth

                if(_user == null) { //means user is not logged in
                  return LoginPage(); //user is not logged in
                }
                else{
                  return HomePage(); //user is logged in
                }
              }

              //check of the Firebase Auth state - loading
              return Scaffold(
                body: Container(
                  child: Center(
                    child: Text("Checking authentication..."),
                  ),
                ),
              );
            },
          );
        }

        //screen that can be displayed during connection to Firebase
        return Scaffold(
          body: Container(
            child: Center(
              child: Text("Initializing App..."),
            ),
          ),
        );
      },
    );
  }
}
