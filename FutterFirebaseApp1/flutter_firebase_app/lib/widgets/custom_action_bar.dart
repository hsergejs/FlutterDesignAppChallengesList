import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/constants.dart';
import 'package:flutter_firebase_app/screens/cart_page.dart';
import 'package:flutter_firebase_app/services/firebase_services.dart';

class CustomActionBar extends StatelessWidget {

  final String title;
  final bool hasBackArrow;
  final bool hasTitle;
  final bool hasBackground;

  CustomActionBar({Key key, this.title, this.hasBackArrow = false, this.hasTitle = true, this.hasBackground = true}) : super(key: key);

  //get collection fo users
  final CollectionReference _userReference = FirebaseFirestore.instance.collection("Users");

  //get user from firebase, as there no possibility to get users from collection reference of users
  //final User _currentUser = FirebaseAuth.instance.currentUser;

  //initialise to get user ID
  FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: hasBackground ? LinearGradient(
          colors: [
            Colors.white,
            Colors.white.withOpacity(0),
          ],
          begin: Alignment(0.0, 0.0), //x and y axis starting from left top
          end: Alignment(0.0, 1.0), //alignment of the gradient scaled 0 to 1
        ) : null, //set too NULL as value bool can't be passed
      ),
      padding: EdgeInsets.only(
        top: 56.0,
        left: 24.0,
        right: 24.0,
        bottom: 42.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //if has back arrow add new container with image
          if(hasBackArrow) //can't set brackets here for IF STATEMENT and must be set default value
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 42.0,
                height: 42.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image(
                  width: 16.0,
                  height: 16.0,
                  image: AssetImage("assets/icons/back_arrow.png"),
                ),
              ),
            ),
          if(hasTitle) //if title true show text, no brackets for if statement
            Text(
              title,
              style: Constants.regulaHeading,
            ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartPage(),
                  ),
              );
            },
            child: Container(
              width: 42.0,
              height: 42.0,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.0),
              ),
              alignment: Alignment.center,
              child: StreamBuilder(
                //stream: _userReference.doc(_currentUser.uid).collection("Cart").snapshots(), //use snapshot to get everything from database in realtime for Cart collection, thus not required to update every time each screen is loaded
                stream: _userReference.doc(_firebaseServices.getUserId()).collection("Cart").snapshots(),
                builder: (context, snapshot){
                  int _totalItemInCart = 0;

                  if(snapshot.connectionState == ConnectionState.active){ //currently have stream from firestore
                    List _documents = snapshot.data.docs; //list of items in cart/documents
                    _totalItemInCart = _documents.length;  //and now we can retrieve length from that list
                  }

                  return Text(
                    "${_totalItemInCart}",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
