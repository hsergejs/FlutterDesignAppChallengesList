import 'package:design_app_challenge_4/constants.dart';
import 'package:design_app_challenge_4/models/Product.dart';
import 'package:design_app_challenge_4/screens/details/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class DetailsScreen extends StatelessWidget {

  final Product product;

  const DetailsScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: product.color,
      appBar: buildAppBar(context),
      body: new Body(product: product), //pass current product
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      elevation: 0,
      backgroundColor: product.color,
      leading: new IconButton(
          icon: new SvgPicture.asset(
            "assets/icons/back.svg",
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
      ),
      actions: [
        new IconButton(
            icon: new SvgPicture.asset("assets/icons/search.svg"),
            onPressed: () {
              print("Search icon pressed");
            },
        ),
        new IconButton(
            icon: new SvgPicture.asset("assets/icons/cart.svg"),
            onPressed: () {
              print("Cart icon pressed");
            },
        ),
        new SizedBox(width: kDefaultPadding/2),
      ],
    );
  }
}
