import 'package:design_app_challenge_5/constants.dart';
import 'package:design_app_challenge_5/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:design_app_challenge_5/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Furniture eStore design app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        textTheme: GoogleFonts.dmSansTextTheme().apply( //set DM Sans as our default fonts with our own text color
          displayColor: kTextColor,
        ),
        appBarTheme: new AppBarTheme( //set default app bar color
          color: Colors.transparent,
          elevation: 0.0, //after color set to transparent there's left opacity color
          brightness: Brightness.light, //return to visible help icons of the phone, e.g. network, time, battery lvl etc
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

