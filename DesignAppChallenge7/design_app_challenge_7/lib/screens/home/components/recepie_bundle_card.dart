import 'package:design_app_challenge_7/models/recepie_bundle.dart';
import 'package:design_app_challenge_7/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecepieBundleCard extends StatelessWidget {

  final RecepieBundle recepieBundle;
  final Function press;

  const RecepieBundleCard({Key key, this.recepieBundle, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double defaultSize = SizeConfig.defaultSize;
    //removed as don't needed, required for building UI AspectRatio(
    //       aspectRatio: 1.65,
    return GestureDetector(
      onTap: press,
      child: Container( //overall container
        decoration: BoxDecoration(
          color: recepieBundle.color,
          borderRadius: BorderRadius.circular(defaultSize * 1.8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(defaultSize * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Text(
                      recepieBundle.title,
                      style: TextStyle(
                        fontSize: defaultSize * 2.2,
                        color: Colors.white,
                      ),
                      maxLines: 2, //max amount of lines visible
                      overflow: TextOverflow.ellipsis, //text overflow is hidden and followed by ...
                    ),
                    SizedBox(height: defaultSize * 0.5),
                    Text(
                      recepieBundle.description,
                      style: TextStyle(
                        color: Colors.white54,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    _buildInfoRow(
                      defaultSize,
                      iconSrc: "assets/icons/pot.svg",
                      text: "${recepieBundle.recepies} Recipes",
                    ),
                    SizedBox(height: defaultSize * 0.5),
                    _buildInfoRow(
                      defaultSize,
                      iconSrc: "assets/icons/chef.svg",
                      text: "${recepieBundle.chefs} Chefs",
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(width: defaultSize * 0.5),
            AspectRatio(
              aspectRatio: 0.71,
              child: Image.asset(
                recepieBundle.imageSrc,
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(double defaultSize, {String iconSrc, text} ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(iconSrc),
        SizedBox(width: defaultSize), //10 px
        Text(
          text,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ],
    );
  }
}