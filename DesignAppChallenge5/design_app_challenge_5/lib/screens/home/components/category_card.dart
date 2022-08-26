import 'package:design_app_challenge_5/components/title_text.dart';
import 'package:design_app_challenge_5/constants.dart';
import 'package:design_app_challenge_5/models/Categories.dart';
import 'package:design_app_challenge_5/size_config.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    //category must be passed
    @required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: new EdgeInsets.all(defaultSize * 2), //20.0
      child: new SizedBox( //container for product image
        width: defaultSize * 20.5, //205
        child: new AspectRatio(
          aspectRatio: 0.83,
          child: new Stack(
            alignment: Alignment.bottomCenter, //allow to swap container places
            children: [
              //new Container( //test container fo visualisation
              //color: Colors.indigo,
              //),
              //this is custom shape => using ClipPath -> unregular form shape, can be replace with container
              new ClipPath(
                clipper: new CategoryCustomShape(),
                child: new AspectRatio(
                  aspectRatio: 1.025,
                  child: new Container(
                    padding: EdgeInsets.all(defaultSize * 2),
                    color: kSecondaryColor,
                    child: new Column( //category title container
                      mainAxisAlignment: MainAxisAlignment.end, //somwhere positioned at top and moved to bottom
                      children: [
                        new TitleText( //component of lib/components/title_text.dart
                          title: category.title,
                        ),
                        new SizedBox(height: defaultSize),
                        new Text(
                          "${category.numOfProducts}+ Products",
                          style: new TextStyle(
                            color: kTextColor.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              new Positioned( //image positioned in stack at the bottom and moved to top with positioned widget
                top: 0,
                left: 0,
                right: 0,
                child: new AspectRatio(
                  aspectRatio: 1.15,
                  child: new FadeInImage.assetNetwork( //fade animation of the image with replacement
                    placeholder: "assets/loading/spinner.gif", //add spinner for loading
                    image: category.image, //load image from jason request
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();

    double height = size.height;
    double width = size.width;
    double cornerSize = 30.0;

    path.lineTo(0, height - cornerSize);
    path.quadraticBezierTo(0, height, cornerSize, height);
    path.lineTo(width-cornerSize, height);
    path.quadraticBezierTo(width, height, width, height-cornerSize);
    path.lineTo(width, cornerSize);
    path.quadraticBezierTo(width, 0, width-cornerSize, 0);
    path.lineTo(cornerSize, cornerSize*0.75);
    path.quadraticBezierTo(0, cornerSize, 0, cornerSize*2);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}