import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {

  final heroTag;
  final fName;
  final foodPrice;

  DetailsPage({this.heroTag, this.fName,this.foodPrice});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  var _selectedCard = 'WEIGHT';
  var unitsAddedRemoved = 0;
  var totalAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7A9BEE),
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: new Text(
          'Details',
          style: new TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontFamily: 'Montserrat Alternates',
          ),
        ),
        actions: [
          new IconButton(
              icon: new Icon(Icons.more_horiz_rounded),
              color: Colors.white,
              onPressed: () {
                print('Pressed more options icon');
              }
          ),
        ],
      ),
      body: new ListView( //listView for the body
        children: [
          Stack( //stack for header and centered bowl image
            children: [
              new Container( //white container with rounded corners
                height: MediaQuery.of(context).size.height - 80.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              new Positioned(
                top: 75.0,
                child: new Container(
                  height: MediaQuery.of(context).size.height - 100.0, //height of white with rounded corners container
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                  ),
                ),
              ),
              new Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width /2) - 100.0,
                child: new Hero(
                    tag: widget.heroTag,
                    child: new Container(
                      height: 200.0,
                      width: 200.0,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage(widget.heroTag),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ),
              ),
              new Positioned( //positioned container for food name
                top: 275.0,
                left: 25.0,
                right: 25.0,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Text( //Food name text
                      widget.fName,
                      style: new TextStyle(
                        fontFamily: 'Montserrat Alternates',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    new SizedBox(height: 20.0),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Text( //Food price text
                          widget.foodPrice,
                          style: new TextStyle(
                            fontFamily: 'Montserrat Alternates',
                            fontSize: 20.0,
                            color: Colors.grey,
                          ),
                        ),
                        new Container( //separator
                          height: 25.0,
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        new Container( //container for add remove items + and -
                          width: 125.0,
                          height: 40.0,
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(13.0),
                            color: new Color(0xff7A9BEE),
                          ),
                          child: new Row( //row for all + and - elements
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              new InkWell( //inkwell for - icon
                                onTap: () {
                                  setState(() {
                                    unitsAddedRemoved == 0 ? unitsAddedRemoved = 0 : unitsAddedRemoved--;
                                    totalAmount = double.parse(widget.foodPrice)*unitsAddedRemoved;
                                  });
                                },
                                child: new Container( //container for - element
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: new BoxDecoration(
                                    borderRadius: new BorderRadius.circular(7.0),
                                    color: new Color(0xff7A9BEE),
                                  ),
                                  child: new Center(
                                    child: new Icon( // - icon
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                              new Text(
                                '$unitsAddedRemoved',
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat Alternates',
                                  fontSize: 18.0,
                                ),
                              ),
                              new InkWell( //inkwell for + icon
                                onTap: () {
                                  setState(() {
                                    unitsAddedRemoved++;
                                    totalAmount = double.parse(widget.foodPrice)*unitsAddedRemoved;
                                  });
                                },
                                child: new Container( // + icon with white container
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: new BoxDecoration(
                                    borderRadius: new BorderRadius.circular(7.0),
                                    color: Colors.white,
                                  ),
                                  child: new Center(
                                    child: new Icon(
                                      Icons.add,
                                      color: new Color(0xff7A9BEE),
                                      size: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    new SizedBox(height: 20.0),
                    new Container(
                      height: 140.0,
                      child: new ListView(
                        scrollDirection: Axis.horizontal, //allow horizontal scroll reft-right instead of up-down
                        children: [
                          _buildInfoCard('WEIGHT', '300', 'G'),
                          new SizedBox(width: 10.0),
                          _buildInfoCard('CALORIES', '267', 'CAL'),
                          new SizedBox(width: 10.0),
                          _buildInfoCard('VITAMINS', 'A, B6', 'VIT'),
                          new SizedBox(width: 10.0),
                          _buildInfoCard('AVAIL', 'NO', 'AV'),
                        ],
                      ),
                    ),
                    new SizedBox(height: 20.0),
                    new Padding(
                      padding: new EdgeInsets.only(bottom: 5.0),
                      child: new Container(
                        height: 60.0,
                        decoration: new BoxDecoration(
                          color: Colors.black,
                          borderRadius: new BorderRadius.only(
                            topLeft: new Radius.circular(10.0),
                            topRight: new Radius.circular(10.0),
                            bottomLeft: new Radius.circular(25.0),
                            bottomRight: new Radius.circular(25.0),
                          ),
                        ),
                        child: new Center(
                          child: new Text(
                            '\u{20AC} $totalAmount',
                            style: new TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat Alternates',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String info, String units){
    return new InkWell(
      onTap: () {
        _selectCard(title);
      },
      child: new AnimatedContainer( //provide animation in our case color change
        duration: new Duration(milliseconds: 500),
        curve: Curves.easeIn, //animation pattern
        height: 100.0,
        width: 100.0,
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(15.0),
          color: title == _selectedCard ? new Color(0xff7A9BEE) : Colors.white,
          border: Border.all(
            color: title == _selectedCard ? Colors.transparent : Colors.grey.withOpacity(0.3),
            style: BorderStyle.solid,
            width: 1.0,
          ),
        ),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text(
                    title,
                    style: new TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Montserrat Alternates',
                      color: title == _selectedCard ? Colors.white : Colors.grey,
                    ),
                  ),
                  new SizedBox(height: 70.0),
                  new Text(
                    info,
                    style: new TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Montserrat Alternates',
                      fontWeight: FontWeight.bold,
                      color: title == _selectedCard ? Colors.white : Colors.black,
                    ),
                  ),
                  new Text(
                    units,
                    style: new TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Montserrat Alternates',
                      color: title == _selectedCard ? Colors.white : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _selectCard(String t){
    setState(() {
      _selectedCard = t;
    });
  }
}
