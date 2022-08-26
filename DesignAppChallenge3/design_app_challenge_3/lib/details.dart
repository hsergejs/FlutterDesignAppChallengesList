import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {

  final String image;
  final String category;
  final String price;
  final String tag;

  const Details( {Key key, this.image, this.category, this.price, this.tag } ) : super (key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Hero(
          tag: widget.tag,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
              boxShadow: [ //NOTE LIST/ARRAY []
                new BoxShadow(
                  color: Colors.grey[400],
                  blurRadius: 10.0,
                  offset: new Offset(0.0, 10.0),
                ),
              ],
            ),
            child: new Stack(
              children: [
                new Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new GestureDetector( //top navigation, back arrow
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: new Container(
                          child: new Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container( //container for favorites
                        width: 35.0,
                        height: 35.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: new Icon(
                          Icons.favorite_border_rounded,
                          size: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                new Positioned( //gradient darken positioned container
                  bottom: 0,
                  left: 0,
                  width: MediaQuery.of(context).size.width,
                  height: 500.0,
                  child: new Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                        begin: Alignment.bottomRight, //FROM WHERE GRADIENT WILL GO
                        colors: [ //NOTE IT'S LIST/ARRAY
                          Colors.black.withOpacity(0.9),
                          Colors.black.withOpacity(0.0),
                        ]
                      ),
                    ),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        new Text(
                          widget.category,
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        new SizedBox(height: 25.0),
                        new Text(
                          'Size',
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        new SizedBox(height: 10.0),
                        new Row(
                          children: [
                            new Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.only(right: 20.0),
                              child: new Center(
                                child: new Text(
                                  '40',
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            new Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.only(right: 20.0),
                              decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: new Center(
                                child: new Text(
                                  '42',
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            new Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.only(right: 20.0),
                              child: new Center(
                                child: new Text(
                                  '44',
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            new Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.only(right: 20.0),
                              child: new Center(
                                child: new Text(
                                  '46',
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        new SizedBox(height: 20.0),
                        new Text(
                          '€'+widget.price,
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        new SizedBox(height: 50.0),
                        new Container(
                          height: 50.0,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(15.0),
                          ),
                          child: new Center(
                            child: new Text(
                              'Buy Now',
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        new SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
