import 'package:design_app_challenge_5/constants.dart';
import 'package:design_app_challenge_5/screens/home/components/body.dart';
import 'package:design_app_challenge_5/size_config.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // It help us to  make our UI responsive
    SizeConfig().init(context); //VERY IMPORTANT TO LOAD INITIATE AT THIS STAGE OF THE APP
    // It help us to  make our UI responsive
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return new AppBar(
      leading: new IconButton(
          icon: SvgPicture.asset(
            "assets/icons/arrow.svg",
            height: SizeConfig.defaultSize != null? SizeConfig.defaultSize*2 : SizeConfig.defaultSize, //20.0
          ),
          onPressed: () {
            print("ORIENTATION: ${SizeConfig.orientation}");
          },
      ),
      actions: [
        new IconButton(
          icon: new SvgPicture.asset(
            "assets/icons/scan.svg",
            height: SizeConfig.defaultSize != null? SizeConfig.defaultSize*2.4 : SizeConfig.defaultSize, //24
          ),
          onPressed: (){ },
        ),
        Center(
          child: new Text(
            "Scan",
            style: new TextStyle(
              color: kTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        new SizedBox(width: SizeConfig.defaultSize != null ? SizeConfig.defaultSize : 10.0),
      ],
    );
  }
}

