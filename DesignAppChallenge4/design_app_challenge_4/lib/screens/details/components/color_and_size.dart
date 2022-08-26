import 'package:design_app_challenge_4/constants.dart';
import 'package:design_app_challenge_4/models/Product.dart';
import 'package:flutter/material.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: [
        Expanded(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Text(
                "Color: ",
              ),
              new Row(
                children: [
                  ColorDot(color: product.color, isSelected: true),
                  ColorDot(color: new Color(0xFFF8C078)),
                  ColorDot(color: new Color(0xFFA29B9B)),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: new RichText(
            text: new TextSpan(
              style: new TextStyle(color: kTextColor),
              children: [
                new TextSpan(
                  text: "Size:\n",
                ),
                new TextSpan(
                  text: "${product.size} cm",
                  style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const ColorDot({
    Key key,
    @required this.product, this.color, this.isSelected = false, //isSelected in constructor set to false
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(2.5),
      margin: EdgeInsets.only(top: kDefaultPadding/4, right: kDefaultPadding/2),
      height: 24.0,
      width: 24.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected == true ? color : Colors.transparent,
        ),
      ),
      child: new DecoratedBox(
        decoration: new BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
