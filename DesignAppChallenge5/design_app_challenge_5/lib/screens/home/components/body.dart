import 'package:design_app_challenge_5/components/title_text.dart';
import 'package:design_app_challenge_5/screens/home/components/Categories.dart';
import 'package:design_app_challenge_5/screens/home/components/recommendation_products.dart';
import 'package:design_app_challenge_5/services/fetchCategories.dart';
import 'package:design_app_challenge_5/services/fetchProducts.dart';
import 'package:design_app_challenge_5/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double defaultSize = SizeConfig.defaultSize;

    return new SingleChildScrollView( //enable scrolling
      child: SafeArea( //add padding that content would fit in scree area, as rounding bottom or top, or camera area
        child: Column( //column for title
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: new EdgeInsets.all(defaultSize * 2), //20.0
              child: TitleText(title: "Browse by Categories"),
            ),
            new FutureBuilder( //allow to build future<>, used for database connections, etc
              future: fetchCategroies(), //used in lib/services/fetchCategories.dart
              builder: (context, snapshot) =>
              snapshot.hasData ? Categories(categories: snapshot.data) : Center(child: Image.asset("assets/loading/ripple.gif")),
            ),
            new Divider(height: 5.0),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20.0
              child: new TitleText(title: "Recommended For You"),
            ),
            new FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) {
                //print(snapshot.data); //test returned output
                return snapshot.hasData ? RecommendProducts(products: snapshot.data) : Center(child: Image.asset("assets/loading/ripple.gif")); //important that no []
              },
            ),
          ],
        ),
      ),
    );
  }
}

