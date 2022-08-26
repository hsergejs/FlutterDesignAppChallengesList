import 'package:design_app_challenge_4/constants.dart';
import 'package:design_app_challenge_4/models/Product.dart';
import 'package:design_app_challenge_4/screens/details/details_screen.dart';
import 'package:design_app_challenge_4/screens/home/components/categories.dart';
import 'package:design_app_challenge_4/screens/home/components/item_card.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: new Text( //display text for Category
            'Women',
            style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),//using build in theme
          ),
        ),
        new Categories(),
        new Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: new GridView.builder( //grid view builder
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( //allow to build grid with specific units per row
                  crossAxisCount: 2, //state units per row
                  childAspectRatio: 0.75, //change size of children
                  mainAxisSpacing: kDefaultPadding, //spacing and sizing of the grid
                  crossAxisSpacing: kDefaultPadding, //spacing of the grid
                ),
                itemBuilder: (context,index) => ItemCard(
                  product: products[index],
                  press: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context) => DetailsScreen(product: products[index],),
                  )
                  ),
                ),
              ),
            ),
        ),
      ],
    );
  }
}



