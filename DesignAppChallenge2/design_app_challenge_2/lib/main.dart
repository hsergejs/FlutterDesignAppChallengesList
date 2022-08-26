import 'package:design_app_challenge_2/detailsPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: NutritionApp(),
  debugShowCheckedModeBanner: false,
));

class NutritionApp extends StatefulWidget {
  @override
  _NutritionAppState createState() => _NutritionAppState();
}

class _NutritionAppState extends State<NutritionApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff21bfbe),
      body: new ListView( //overall listVeiew for all elements on scene, separated by row to have spacing and two icons on the right
        children: [
          new Padding(
              padding: new EdgeInsets.only(top: 15.0, left: 10.0),
              child: new Row(// row for icon buttons on top of the scene
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new IconButton( //arrow back icon button
                      icon: new Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: () { print('Pressed back icon button'); },
                  ),
                  new Container( //container for filter and settings icon button
                    width: 125.0,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            icon: new Icon(Icons.filter_list),
                            color: Colors.white,
                            onPressed: () { print('Pressed filter list icon'); },
                        ),
                        IconButton(
                          icon: new Icon(Icons.casino_outlined),
                          color: Colors.white,
                          onPressed: () { print('Pressed menu icon'); },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ),
          new SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Row( // row for header text, because consists of two stylings
              children: [
                new Text(
                  'Healthy',
                  style: new TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat Alternates',
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                new SizedBox(width: 10.0),
                new Text(
                  'Food',
                  style: new TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat Alternates',
                    fontSize: 25.0,
                  ),
                ),
              ],
            ),
          ),
          new SizedBox(height: 45.0),
          new Container( //container for white area with scrollable listView
            height: MediaQuery.of(context).size.height - 185.0, //provide size of the main container measuring from top of the scene
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(75.0)
              ),
            ),
            child: new ListView( //listView for dish variants, scrollable
              primary: false, //allow scrolling
              padding: new EdgeInsets.only(left: 25.0, right: 20.0),
              children: [
                new Padding(
                  padding: new EdgeInsets.only(top: 45.0),
                  child: new Container(
                    height: MediaQuery.of(context).size.height - 315.0, //add responsive padding/margin from top, provide size of container with listView of dish items
                    child: new ListView( //lissView of food elements
                      children: [
                        _buildItemsInList('assets/images/f1.jpg', 'Cheese Potatoes', '6.55'),
                        _buildItemsInList('assets/images/f2.jpg', 'Chicken Cheese', '8.55'),
                        _buildItemsInList('assets/images/f3.jpg', 'Fried Chicken', '3.55'),
                        _buildItemsInList('assets/images/f4.jpeg', 'Tomato Eggs', '10.55'),
                        _buildItemsInList('assets/images/f5.jpeg', 'Bread and Fish', '7.55'),
                        _buildItemsInList('assets/images/f6.jpg', 'Classic Udon', '6.55'),
                        _buildItemsInList('assets/images/f7.jpg', 'Rice Curry', '26.32'),

                      ],
                    ),
                  ),
                ),
                new SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: new Row( //row for bottom menu items
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new Container( //container for search button
                        height: 55.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          border: new Border.all(
                            color: Colors.grey[400],
                            style: BorderStyle.solid,
                            width: 2.0,
                          ),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: new Center(
                          child: new IconButton(
                            onPressed: () { print('Pressed search icon'); },
                            icon: new Icon(Icons.search_rounded),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Row( //row for next two elements of bottom menu
                        children: [
                          new Container(
                            height: 55.0,
                            width: 50.0,
                            decoration: new BoxDecoration(
                              border: new Border.all(
                                color: Colors.grey[400],
                                style: BorderStyle.solid,
                                width: 2.0,
                              ),
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: new Center(
                              child: new IconButton(
                                onPressed: () { print('Pressed cart icon'); },
                                icon: new Icon(Icons.shopping_cart_rounded),
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          new SizedBox(width: 20.0),
                          new Container(
                            height: 55.0,
                            width: 120.0,
                            decoration: new BoxDecoration(
                              border: new Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 2.0,
                              ),
                              color: Colors.black,
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: new Center(
                              child: new Text(
                                'Checkout',
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat Alternates',
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsInList(String imgPath, String foodName, String price){
    return new Padding(
      padding: new EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: new InkWell( //provide onTap action with splash animation on rectangular area
        onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => DetailsPage(heroTag: imgPath, fName: foodName, foodPrice: price)
                )
            );
          },
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            new Container(
              child: new Row(
                children: [
                  new Hero( //provide HERO transition automatically/animation
                    tag: imgPath,
                    child: new Image(
                      image: new AssetImage(imgPath),
                      fit: BoxFit.cover,
                      height: 70.0,
                      width: 70.0,
                    ),
                  ),
                  new SizedBox(width: 10.0),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Text(
                        foodName,
                        style: new TextStyle(
                          fontFamily: 'Montserrat Alternates',
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      new Text(
                        '\u{20AC}$price',
                        style: new TextStyle(
                          fontFamily: 'Montserrat Alternates',
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            new IconButton(
              onPressed: () { print('Pressed add icon'); },
              icon: new Icon(Icons.add),
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

}
