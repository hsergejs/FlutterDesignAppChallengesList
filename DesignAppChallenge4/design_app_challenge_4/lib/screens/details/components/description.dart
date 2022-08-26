import 'package:design_app_challenge_4/constants.dart';
import 'package:design_app_challenge_4/models/Product.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: new Text(
        product.description,
        style: new TextStyle(
          height: 1.5,
        ),
      ),
    );
  }
}
