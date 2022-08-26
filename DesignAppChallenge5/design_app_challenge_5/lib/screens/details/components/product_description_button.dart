import 'package:design_app_challenge_5/constants.dart';
import 'package:design_app_challenge_5/models/Product.dart';
import 'package:design_app_challenge_5/size_config.dart';
import 'package:flutter/material.dart';

class ProductDescriptionButton extends StatelessWidget {
  const ProductDescriptionButton({
    Key key,
    @required this.product,
    this.press,
  }) : super(key: key);

  final Product product;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return new Container(
      constraints: new BoxConstraints(minHeight: defaultSize * 44), //set min height of container
      padding: EdgeInsets.only(
          top: defaultSize * 9, //90
          left: defaultSize * 2, //20
          right: defaultSize * 2 //20
      ),
      //height: 500.0, //for ui dev purposes
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
          topRight: Radius.circular(defaultSize * 1.2),
          topLeft: Radius.circular(defaultSize * 1.2),
        ),
      ),
      child: SafeArea(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text(
              product.subTitle,
              style: new TextStyle(
                fontSize: defaultSize * 1.8,
                fontWeight: FontWeight.bold,
              ),
            ),
            new SizedBox(height: defaultSize * 3),
            new Text(
              product.description,
              style: new TextStyle(
                color: kTextColor.withOpacity(0.7),
                height: 1.5,
              ),
            ),
            new SizedBox(height: defaultSize * 3),
            SizedBox( //will allow to style lenght
              width: double.infinity,
              child: new FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                padding: EdgeInsets.all(defaultSize * 1.5),
                color: kPrimaryColor,
                onPressed: press,
                child: new Text(
                  "Add To Cart Now",
                  style: new TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: defaultSize * 1.6,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

