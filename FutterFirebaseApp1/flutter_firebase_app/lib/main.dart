import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/constants.dart';
import 'package:flutter_firebase_app/screens/landing_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            //using textTheme as required to use in all app
            Theme.of(context)
                .textTheme, //activating textTheme in current context
          ),
          accentColor: Colors.redAccent,
        ),
        title: "aCommerce Shoe App, with FireBase",
        home: LandingPage(),
    );
  }
}

class ConnectingDBExample extends StatelessWidget {

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
        if (snapshot.connectionState == ConnectionState.done) {
          //means that Firebase.initializeApp(); has no errors
          return Scaffold(
            body: Container(
              child: Center(
                child: Text(
                  "Connection to FireBase is done right!",
                  style: Constants.regulaHeading,
                ),
              ),
            ),
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

