import 'package:design_app_challenge_5/constants.dart';
import 'package:design_app_challenge_5/models/Product.dart';
import 'package:design_app_challenge_5/screens/details/components/product_description_button.dart';
import 'package:design_app_challenge_5/screens/details/components/product_info.dart';
import 'package:design_app_challenge_5/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {

  final Product product;

  const Body( {
    Key key,
    @required this.product
  } ) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double defaultSize = SizeConfig.defaultSize;

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity, //max container width
        //height: SizeConfig.screenHeight, //from SizeConfig.dart get current screen height
        //height: SizeConfig.screenHeight - AppBar().preferredSize.height, //remove extra space from the bottom
        height: SizeConfig.orientation == Orientation.landscape
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight - AppBar().preferredSize.height, //sizing according phone orientation
        child: new Stack(
          //crossAxisAlignment: CrossAxisAlignment.start, before image was added for design purposes
          children: [
            ProductInfo(product: product),
            Positioned(
              top: defaultSize * 37.5, //370 position from top of the screen
              left: 0.0,
              right: 0.0,
              child: ProductDescriptionButton(
                product: product,
                press: () {},
              ),
            ),
            new Positioned(
                top: defaultSize * 9.5,
                right: -defaultSize * 7.5,
                child: Hero( //provide nice animation
                  tag: product.id, //connected through tag: id
                  child: Image.network(
                    product.image,
                    height: defaultSize * 37.8, //378
                    width: defaultSize * 36.4, //364
                    fit: BoxFit.cover,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}

