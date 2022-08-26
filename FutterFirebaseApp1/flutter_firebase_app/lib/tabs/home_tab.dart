import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/screens/product_page.dart';
import 'package:flutter_firebase_app/services/firebase_services.dart';
import 'package:flutter_firebase_app/widgets/custom_action_bar.dart';
import 'package:flutter_firebase_app/widgets/product_card.dart';


//Getting the data from real time using StreamBuilder, live database updates fired straight away to the app
//Getting once data from database and displaying it to the user using FutureBuilder<>


class HomeTab extends StatelessWidget {

  //final CollectionReference _productsReference = FirebaseFirestore.instance.collection("Products"); //name of the collection
  FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>( //specify as not might be loaded data
            future: _firebaseServices.productsReference.get(), //get all data
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
                  padding: EdgeInsets.only(top: 108.0, bottom: 12.0),
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
          CustomActionBar(
            hasBackArrow: false,
            title: "Home",
          ),
        ],
      ),
    );
  }
}
