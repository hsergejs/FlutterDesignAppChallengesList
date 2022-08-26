import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BurgerPage extends StatefulWidget {

  final imgPath, foodName, price, heroTag;

  const BurgerPage({Key key, this.imgPath, this.foodName, this.price, this.heroTag}) : super(key: key);

  @override
  _BurgerPageState createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {

  var netPrice = 0.0;
  var quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: [
          new Padding(
            padding: EdgeInsets.all(15.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                Icons.menu,
                color: Colors.black),
                new Stack( // cart icon with added amount in cart
                  children: [
                    new Container(
                      height: 45.0,
                      width: 45.0,
                      color: Colors.transparent,
                    ),
                    new Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: new BoxDecoration(
                        color: Color(0xFFFE7D6A),
                        shape: BoxShape.circle,
                        boxShadow: [ //important [] a list !!!!!!!!
                          BoxShadow(
                            color: Color(0xFFFE7D6A).withOpacity(0.3),
                            blurRadius: 6.0,
                            spreadRadius: 4.0,
                            offset: Offset(0.0, 4.0),
                          ),
                        ],
                      ),
                      child: new Center(
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white
                        ),
                      ),
                    ),
                    new Positioned( //positioned cart counter container
                        top: 1.0,
                        right: 4.0,
                        child: new Container(
                          height: 12.0,
                          width: 12.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: new Text(
                              "1",
                              style: GoogleFonts.notoSans(
                                fontSize: 7.0,
                                textStyle: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ),
                  ],
                )
              ],
            ),
          ),
          new SizedBox(height: 50.0),
          new Column( //container as a button, with shadow, looks like raised
            children: [
              new Stack(
                children: [
                  new Container( //this is a shadow implementation
                    height: 45.0,
                    width: 40.0,
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(15.0),
                      boxShadow: [
                        new BoxShadow(
                          color: Color(0xFFFE7D6A).withOpacity(0.1),
                          blurRadius: 6.0,
                          spreadRadius: 6.0,
                          offset: Offset(5.0, 11.0),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: new Center(
                      child: Icon(
                        Icons.favorite_border_rounded,
                        color: Color(0xFFFE7D6A),
                        size: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          new SizedBox(height: 50.0),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              new Container(
                height: 70.0,
                width: 140.0,
                color: Colors.white,
                child: new Center(
                  child: new Text(
                    "\$" + (double.parse(widget.price) * quantity).toString(), //one of the possible output ways
                    style: GoogleFonts.notoSans(
                      fontSize: 40.0,
                      color: Color(0xFF5E6166),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              new Container(
                height: 60.0,
                width: 200.0,
                decoration: new BoxDecoration(
                  color: Color(0xFFFE7D6A),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new Container(
                        height: 40.0,
                        width: 105.0,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: new Row(
                          children: [
                            new IconButton(
                                iconSize: 17.0,
                                icon: Icon(Icons.remove, color: Colors.black),
                                onPressed: () {
                                  adjustQuantity('MINUS');
                                },
                            ),
                            new Text(
                              quantity.toString(),
                              style: GoogleFonts.notoSans(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            new IconButton(
                              iconSize: 17.0,
                              icon: Icon(Icons.add, color: Colors.black),
                              onPressed: () {
                                adjustQuantity('PLUS');
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: new Text(
                          "Cart++",
                          style: GoogleFonts.notoSans(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  adjustQuantity(pressed) {
    switch(pressed) {
      case "PLUS" :
        setState(() {
          quantity +=1;
        });
        return;
      case "MINUS" :
        setState(() {
          if(quantity !=0){
            quantity -=1;
          }
        });
        return;
    }
  }
}
