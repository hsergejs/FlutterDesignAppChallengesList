import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/constants.dart';
import 'package:flutter_firebase_app/services/firebase_services.dart';
import 'package:flutter_firebase_app/widgets/input_field.dart';
import 'package:flutter_firebase_app/widgets/product_card.dart';

class SearchTab extends StatefulWidget { //using setState required stfull widget

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  FirebaseServices _firebaseServices = FirebaseServices();

  String _searchString = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack( //ListView is not working, error of expanded
        children: [ //using z-index, as field should be at the top

          if(_searchString.isEmpty) //no brackets pay attention
            Center(
              child: Container(
                  child: Text(
                      "Search Results",
                      style: Constants.regularDarkText,
                  ),
              ),
            )
          else
          FutureBuilder<QuerySnapshot>( //specify as not might be loaded data
            future: _firebaseServices.productsReference.orderBy("name")
                .startAt([_searchString])
                .endAt(["$_searchString\uf8ff"]) // \uf8ff is a special character ???? make it case unsensitive not really good example
                .get(), //get all data
            builder: (context, snapshot) {
              //if there are any errors!
              //required to allow authenticated users to fetch data from database e.g. allow read, write: if request.auth.uid != null; in firestore rules
              if (snapshot.hasError) {
                //for check setup purposes check for received snapshot on errors
                print("Error: ${snapshot.error}");
              }

              //collection data is ready to be displayed
              if(snapshot.connectionState == ConnectionState.done){
                //display the data from collection
                return ListView(
                  padding: EdgeInsets.only(top: 128.0, bottom: 12.0),
                  children: snapshot.data.docs.map((document) { //getting data from snapshot as all documents and map document to item
                    return ProductCard(
                      title: document.data()['name'],
                      imgUrl: document.data()['images'][0], //as required string
                      price: "€${document.data()['price']}",
                      /*
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductPage(productId: document.id),
                            ),
                        );
                      },
                       */
                      productId: document.id,
                    );
                  }).toList(), //highly important as List is required to be returned!
                );
              }


              //loading state
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );

            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 45.0),
            child: CustomInputField( //from widgets/input_field.dart
              txt: "Search here...",
              onSubmited: (value) {
                  setState(() {
                    _searchString = value.toLowerCase();
                  });
              },
            ),
          ),
        ],
      ),
    );
  }
}
