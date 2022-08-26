import 'package:design_app_challenge_7/models/nav_item.dart';
import 'package:design_app_challenge_7/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavItems(), //used in models/nav_item.dart
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recepie App',
        theme: ThemeData(
          //backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme( //apply this as most of the screens have same design theme
            color: Colors.white,
            elevation: 0,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

