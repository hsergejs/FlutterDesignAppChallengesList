import 'package:design_app_challenge_7/components/my_bottom_nav_bar.dart';
import 'package:design_app_challenge_7/screens/home/components/body.dart';
import 'package:design_app_challenge_7/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //activating adaptive screen design
    SizeConfig().init(context);

    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      //because BottomNavigationBar don't accept SVG, we use other approach
      //use Provider to manage state of the NavBar
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return new AppBar(
      leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: () {},
      ),
      title: Image.asset("assets/images/logo.png"),
      centerTitle: true,
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
        SizedBox(
          //padding from right is 5px as defaultSize calculated as 10
            width: SizeConfig.defaultSize * 0.5,
        ),
      ],
    );
  }
}

