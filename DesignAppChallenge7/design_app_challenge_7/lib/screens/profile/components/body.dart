import 'package:design_app_challenge_7/constants.dart';
import 'package:design_app_challenge_7/screens/profile/components/profile_info.dart';
import 'package:design_app_challenge_7/screens/profile/components/profile_menu_item.dart';
import 'package:design_app_challenge_7/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileInfo(
            image: "assets/images/pic.png",
            email: "email@gmail.com",
            name: "Serg Holostov",
          ),
          SizedBox(height: defaultSize * 2),
          ProfileMenuItem(iconPath: "assets/icons/bookmark_fill.svg", title: "Saved Recipes", press: () { }),
          ProfileMenuItem(iconPath: "assets/icons/chef_color.svg", title: "Super Plan", press: () { }),
          ProfileMenuItem(iconPath: "assets/icons/language.svg", title: "Change Language", press: () { }),
          ProfileMenuItem(iconPath: "assets/icons/info.svg", title: "Help", press: () { }),
        ],
      ),
    );
  }
}



