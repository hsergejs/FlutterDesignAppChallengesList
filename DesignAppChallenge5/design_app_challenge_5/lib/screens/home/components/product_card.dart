import 'package:design_app_challenge_5/components/title_text.dart';
import 'package:design_app_challenge_5/constants.dart';
import 'package:design_app_challenge_5/models/Product.dart';
import 'package:design_app_challenge_5/size_config.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  final Product product;
  final Function press; //provide passing parameters of the required product

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return new GestureDetector(
      onTap: press,
      child: new Container(
        width: defaultSize * 14.5, //154
        decoration: new BoxDecoration(
          color: kSecondaryColor,
          borderRadius: new BorderRadius.circular(30.0),
        ),
        child: new AspectRatio(
          aspectRatio: 0.693,
          child: new Column(
            children: [
              new AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: product.id, //provide nice animation connected on id -> body.dart
                  child: FadeInImage.assetNetwork( //load image from Product.dart json
                    placeholder: "assets/loading/spinner.gif",
                    image: product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultSize),
                child: new TitleText( //provide title_text.dart
                  title: product.title,
                ),
              ),
              new SizedBox(height: defaultSize/2),
              new Text(
                  "€ ${product.price}"
              ),
              new Spacer(), //provide space in between can be setup as Spacer(flex: 2)
            ],
          ),
        ),
      ),
    );
  }
}