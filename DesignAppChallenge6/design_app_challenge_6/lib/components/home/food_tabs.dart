import 'package:design_app_challenge_6/details/components/details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FoodTab extends StatefulWidget {
  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView( //list which goes down in the tab
        children: [
          _buildListItem("Delicious Hot Dog", 4.0, "23.99", "assets/images/1.gif"),
          _buildListItem("Pizza", 5.0, "25.99", "assets/images/2.gif"),
        ],
      ),
    );
  }

  _buildListItem(String foodName, rating, String price, String imgPath){
    return Padding(
      padding: new EdgeInsets.all(15.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => BurgerPage(heroTag: foodName, foodName: foodName, price: price, imgPath: imgPath)),
              );
            },
            child: new Container(
              width: 220.0,
              child: new Row(
                children: [
                  new Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(7.0),
                      color: new Color(0xFFFFE3DF),
                    ),
                    child: new Center(
                      child: new Image.asset(
                        imgPath,
                        height: 50.0,
                        width: 50.0,
                      ),
                    ),
                  ),
                  new SizedBox(width: 20.0),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Text(
                        foodName,
                        style: GoogleFonts.notoSans(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      new SmoothStarRating( //allow to use start rating
                        allowHalfRating: false,
                        starCount: rating.toInt(),
                        rating: rating,
                        color: Color(0xFFFFD143),
                        borderColor: Color(0xFFFFD143),
                        size: 15.0,
                        spacing: 0.0,
                        onRated: (v) {
                          //changed rating value
                        },
                      ),
                      new Row(
                        children: [
                          new Text(
                            "\$" + price,
                            style: GoogleFonts.lato(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              textStyle: new TextStyle(
                                color: Color(0xFFF68D7F),
                              ),
                            ),
                          ),
                          new SizedBox(width: 3.0),
                          new Text(
                            "\$18",
                            style: GoogleFonts.lato(
                              fontSize: 12.0,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w600,
                              textStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.4),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          FloatingActionButton(
            heroTag: foodName,
            mini: true,
            backgroundColor: Color(0xFFFE7D6A),
            onPressed: () {},
            child: new Center(
              child: Icon(
                  Icons.add,
                  color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
