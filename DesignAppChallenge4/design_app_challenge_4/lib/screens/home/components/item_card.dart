import 'package:design_app_challenge_4/constants.dart';
import 'package:flutter/material.dart';
import 'package:design_app_challenge_4/models/Product.dart';


class ItemCard extends StatelessWidget {

  final Product product;
  final Function press;

  const ItemCard({
    Key key, this.product, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded( //expand all children to available container size
            child: new Container(
              padding: new EdgeInsets.all(kDefaultPadding),
              //fixed box sizing used for UI visualisation, commented as SilverGridDelegateWithFixedCrossAxisCount() has own setups
              //height: 180,
              //width: 160,
              decoration: new BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Hero(
                tag: "${product.id}",
                child: new Image.asset(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding/4),
            child: new Text(
              product.title,
              style: new TextStyle(
                color: kTextLightColor,

              ),
            ),
          ),
          new Text(
            "${product.price}", //NOTE ON INTEGER TO STRING
            style: new TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}