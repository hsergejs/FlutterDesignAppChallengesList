import 'package:design_app_challenge_5/models/Product.dart';
import 'package:design_app_challenge_5/screens/details/details_screen.dart';
import 'package:design_app_challenge_5/screens/home/components/product_card.dart';
import 'package:design_app_challenge_5/size_config.dart';
import 'package:flutter/material.dart';

class RecommendProducts extends StatelessWidget {
  const RecommendProducts({
    Key key,
    this.products,
  }) : super(key: key);

  //because API return list of products in fetchProducts.dart
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize * 2), //20.0
      child: new GridView.builder(
        shrinkWrap: true, //not allow to occupy all available space parent container allow, only required space
        itemCount: products.length,
        //turn off fridView scrolling, this allow to scroll not GridView, but whole app page
        physics: NeverScrollableScrollPhysics(), //Scroll physics that does not allow the user to scroll
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: SizeConfig.orientation == Orientation.portrait ? 2 : 4, //setting items count according screen orientation
          childAspectRatio: 0.639,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
        ),
        itemBuilder: (context,index) => ProductCard(product: products[index], press: () {
          Navigator.push( //provide navigation to details page
              context,
              new MaterialPageRoute(
                  builder: (context) => DetailsScreen(product: products[index]), //to where route is
              ),
          );
        }),
      ),
    );
  }
}




