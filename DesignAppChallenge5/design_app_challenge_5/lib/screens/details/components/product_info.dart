import 'package:design_app_challenge_5/constants.dart';
import 'package:design_app_challenge_5/models/Product.dart';
import 'package:design_app_challenge_5/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    TextStyle lightTextStyle = new TextStyle(color: kTextColor.withOpacity(0.6));
    return new Container(
      height: defaultSize * 37.5, //375
      width: defaultSize * (SizeConfig.orientation == Orientation.landscape ? 35 : 16), //change sizing on orientation
      //color: Colors.grey, //to check container
      padding: new EdgeInsets.symmetric(horizontal: defaultSize * 2),
      child: SafeArea(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text(
              product.category.toUpperCase(),
              style: lightTextStyle,
            ),
            new SizedBox(height: defaultSize),
            new Text(
              product.title,
              style: new TextStyle(
                fontSize: defaultSize * 2.4, //24.0 can be used in any sizing as seems from this even font sizing
                fontWeight: FontWeight.bold,
                letterSpacing: -0.8,
                height: 1.4, //height of the text container
              ),
            ),
            new SizedBox(height: defaultSize * 2),
            new Text(
              "From",
              style: lightTextStyle,
            ),
            new Text(
              "€${product.price}",
              style: new TextStyle(
                fontSize: defaultSize * 1.6, //16
                fontWeight: FontWeight.bold,
                height: 1.6, //height of the container of text
              ),
            ),
            new SizedBox(height: defaultSize * 2),
            new Text(
              "Available Colors",
              style: lightTextStyle,
            ),
            Row(
              children: [
                buildColorChoice(defaultSize: defaultSize, color: Color(0xFF7BA275), isActive: true),
                buildColorChoice(defaultSize: defaultSize, color: Color(0xFFD7D7D7)),
                buildColorChoice(defaultSize: defaultSize, color: kTextColor),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildColorChoice({double defaultSize, Color color, bool isActive = false}) {
    return new Container(
      margin: EdgeInsets.only(top: defaultSize, right: defaultSize),
      //for fixed values use const for better performance
      padding: const EdgeInsets.all(5),
      height: defaultSize * 2.4,
      width: defaultSize * 2.4,
      decoration: new BoxDecoration(
        color: color,
        borderRadius: new BorderRadius.circular(6),
      ),
      child: isActive ? new SvgPicture.asset("assets/icons/check.svg") : SizedBox(),
    );
  }
}
