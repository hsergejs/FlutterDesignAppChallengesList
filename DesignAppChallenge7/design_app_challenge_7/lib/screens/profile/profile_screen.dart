import 'package:design_app_challenge_7/components/my_bottom_nav_bar.dart';
import 'package:design_app_challenge_7/constants.dart';
import 'package:design_app_challenge_7/screens/profile/components/body.dart';
import 'package:design_app_challenge_7/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      title: Text(
          "Profile",
      ),
      centerTitle: true,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          color: Colors.white,
        ),
        onPressed: null,
      ),
      actions: [
        FlatButton(
            onPressed: () {},
            child: Text(
              "Edit",
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.defaultSize * 1.6,
                fontWeight: FontWeight.bold,
              ),
            ),
        ),
      ],
    );
  }
}
