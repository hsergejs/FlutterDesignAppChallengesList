import 'package:design_app_challenge_4/constants.dart';
import 'package:design_app_challenge_4/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: new Row(
        children: [
          new Container(
            height: 50.0,
            width: 58.0,
            margin: EdgeInsets.only(right: kDefaultPadding),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              border: Border.all(color: product.color),
            ),
            child: new IconButton(
              icon: SvgPicture.asset("assets/icons/add_to_cart.svg", color: product.color),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: new SizedBox(
              height: 50.0,
              child: new FlatButton(
                onPressed: () {},
                shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: product.color,
                child: new Text(
                  "Order Now".toUpperCase(),
                  style: new TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

