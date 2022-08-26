import 'package:design_app_challenge_7/models/recepie_bundle.dart';
import 'package:design_app_challenge_7/screens/home/components/categories.dart';
import 'package:design_app_challenge_7/screens/home/components/recepie_bundle_card.dart';
import 'package:design_app_challenge_7/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Categories(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 2),
              child: GridView.builder(
                  itemCount: recepieBundles.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: SizeConfig.orientation == Orientation.landscape ? 2 : 1,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: SizeConfig.orientation == Orientation.landscape ? SizeConfig.defaultSize * 2 : 0, //in Landscape containers are stitched together, add spacing
                    childAspectRatio: 1.65,
                  ),
                  itemBuilder: (context,index) => RecepieBundleCard(
                      recepieBundle: recepieBundles[index],
                      press: () {

                      },
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




