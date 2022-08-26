import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'details.dart';

void main() => runApp(MaterialApp(
  home: HomePage(),
  debugShowCheckedModeBanner: false,
));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        centerTitle: true,
        title: new Text(
          'Shoes',
          style: new TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          new IconButton(
              icon: new Icon(Icons.notifications_none),
              color: Colors.black,
              onPressed: () {
                print('Pressed notifications icon');
              },
          ),
          new IconButton(
            icon: new Icon(Icons.shopping_cart),
            color: Colors.black,
            onPressed: () {
              print('Pressed shopping cart icon');
            },
          ),
        ],
      ),
      body: new SingleChildScrollView( //A box in which a single widget can be scrolled.
        child: new Container(
          padding: EdgeInsets.all(20.0),
          child: new Column(
            children: [
              new Container(
                height: 40.0,
                child: new ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    new AspectRatio( //A widget that attempts to size the child to a specific aspect ratio. Provide multiscreening
                      aspectRatio: 2.2/1, //width / height
                      child: new Container( //submenu item all
                        margin: EdgeInsets.only(right: 10.0),
                        decoration: new BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: new Center(
                          child: new Text(
                            'All',
                            style: new TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    new AspectRatio( //submenu item sneakers
                      aspectRatio: 2.2/1,
                      child: new Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: new Center(
                          child: new Text(
                            'Sneakers',
                            style: new TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    new AspectRatio( //submenu item sneakers
                      aspectRatio: 2.2/1,
                      child: new Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: new Center(
                          child: new Text(
                            'Football',
                            style: new TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    new AspectRatio( //submenu item sneakers
                      aspectRatio: 2.2/1,
                      child: new Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: new Center(
                          child: new Text(
                            'Soccer',
                            style: new TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    new AspectRatio( //submenu item sneakers
                      aspectRatio: 2.2/1,
                      child: new Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: new Center(
                          child: new Text(
                            'Golf',
                            style: new TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              new SizedBox(height: 20.0),
              _makeItem(image: 'assets/images/1.jpg', category: 'Sneakers', price: '175', tag: 'red', context: context),
              _makeItem(image: 'assets/images/3.jpg', category: 'Air Jordan', price: '250', tag: 'blue', context: context),
              _makeItem(image: 'assets/images/2.jpg', category: 'Air Max', price: '199', tag: 'black', context: context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _makeItem({image, category, price, tag, context}){
    return new Hero(
        tag: tag,
        child: new GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Details(image: image, category: category, price: price, tag: tag)));
          },
          child: new Container( //container for image
            height: 250.0,
            width: double.infinity, //I want to be as big as my parent allows (double.infinity) some widgets allow to be max of their size
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.only(bottom: 20.0),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: new DecorationImage(
                image: new AssetImage(image),
                fit: BoxFit.cover,
              ),
              boxShadow: [ //NOTE ARRAY []
                new BoxShadow(
                  color: Colors.grey[400],
                  blurRadius: 10.0,
                  offset: new Offset(0.0, 10.0),
                ),
              ],
            ),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start, //alignment of price to start of column
              mainAxisAlignment: MainAxisAlignment.spaceBetween, //alignment of price to bottom of column
              children: [
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.start, //align to top add to favorite
                  children: [
                    Expanded(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start, //align category and brand to start
                        children: [
                          new Text(
                            category,
                            style: new TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          new SizedBox(height: 10.0),
                          new Text(
                            'Nike',
                            style: new TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    new GestureDetector(
                      onTap: () {
                        print('Tapped favorite container');
                      },
                      child: new Container( //container for vaforites
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
                    ),
                  ],
                ),
                new Text( //price text
                  '€ $price',
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ),
    );
  }

}

