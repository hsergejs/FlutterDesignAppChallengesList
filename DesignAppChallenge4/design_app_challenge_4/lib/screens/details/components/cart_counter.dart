import 'package:design_app_challenge_4/constants.dart';
import 'package:flutter/material.dart';

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {

  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: [
        buildOutlinedButton(icon: Icons.remove, press: () {
          setState(() {
            if(numOfItems > 1) {
              numOfItems--;
            }
          });
        }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
          child: new Text(
            numOfItems.toString().padLeft(2, "0"), //if counter is less than 10, show 01, 02 etc
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlinedButton(icon: Icons.add, press: () {
          setState(() {
            numOfItems++;
          });
        }),
      ],
    );
  }

  SizedBox buildOutlinedButton( {IconData icon, Function press} ) {
    return new SizedBox(
      height: 32.0,
      width: 40.0,
      child: new OutlineButton( //button with border
        onPressed: press,
        padding: EdgeInsets.zero,
        child: new Icon(icon),
        shape: new RoundedRectangleBorder( //privide rounded border on button
          borderRadius: BorderRadius.circular(13.0),
        ),
      ),
    );
  }
}

