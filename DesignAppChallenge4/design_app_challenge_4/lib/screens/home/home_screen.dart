import 'package:design_app_challenge_4/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return new AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: new IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () {
            print("Back icon button pressed in appBar!");
          },
      ),
      actions: [
        new IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              color: kTextColor,
            ),
            onPressed: (){
              print("Search icon button pressed in appBar");
            },
        ),
        new IconButton(
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              color: kTextColor,
            ),
            onPressed: () {
              print("Cart icon button pressed in appBar");
            },
        ),
        new SizedBox(width: kDefaultPadding/2),
      ],
    );
  }
}
