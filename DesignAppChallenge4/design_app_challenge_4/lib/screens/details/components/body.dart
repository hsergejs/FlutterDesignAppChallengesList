import 'package:design_app_challenge_4/constants.dart';
import 'package:design_app_challenge_4/models/Product.dart';
import 'package:design_app_challenge_4/screens/details/components/add_to_cart.dart';
import 'package:design_app_challenge_4/screens/details/components/color_and_size.dart';
import 'package:design_app_challenge_4/screens/details/components/counter_with_fav.dart';
import 'package:design_app_challenge_4/screens/details/components/description.dart';
import 'package:design_app_challenge_4/screens/details/components/product_tite_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {

  final Product product;

  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size; //provide total height and width of the screen

    return new SingleChildScrollView(
      child: new Column(
        children: [
          new SizedBox(
            height: size.height,
            child: new Stack(
              children: [
                new Container( //white rounded container goes second, as index of view required 1 and product image 2
                  //height: 500.0, //was for development process
                  margin: new EdgeInsets.only(top: size.height * 0.3),
                  padding: new EdgeInsets.only(top: size.height * 0.12, left: kDefaultPadding, right: kDefaultPadding),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: new Radius.circular(24.0),
                      topRight: new Radius.circular(24.0),
                    ),
                  ),
                  child: new Column(
                    children: [
                      new ColorAndSize(product: product),
                      new SizedBox(height: kDefaultPadding / 2),
                      new Description(product: product),
                      new SizedBox(height: kDefaultPadding / 2),
                      CounterWithFavButton(),
                      new SizedBox(height: kDefaultPadding / 2),
                      AddToCart(product: product),
                    ],
                  ),
                ),
                new ProductTitleWithImage(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

