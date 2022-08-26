import 'package:design_app_challenge_5/constants.dart';
import 'package:design_app_challenge_5/models/Product.dart';
import 'package:design_app_challenge_5/screens/details/components/body.dart';
import 'package:design_app_challenge_5/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {

  final Product product;

  const DetailsScreen( {
    Key key,
    @required this.product //required to be passed or give error
  } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); //initiate screen sizing !!!!IMPORTANT TO START USING IT
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      leading: IconButton(
        icon: new SvgPicture.asset("assets/icons/arrow.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        new IconButton(
            icon: new SvgPicture.asset("assets/icons/bag.svg"),
            onPressed: () {}
            ),
        new SizedBox(width: SizeConfig.defaultSize),
      ],
    );
  }
}
