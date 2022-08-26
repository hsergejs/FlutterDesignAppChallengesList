import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/screens/product_page.dart';
import 'package:flutter_firebase_app/services/firebase_services.dart';
import 'package:flutter_firebase_app/widgets/custom_action_bar.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  FirebaseServices _firebaseServices = FirebaseServices();

  BouncingScrollPhysics _bouncingScrollPhysics = BouncingScrollPhysics();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<QuerySnapshot>( //specify as not might be loaded data
            future: _firebaseServices.userReference.doc(_firebaseServices.getUserId()).collection("Cart").get(), //get all data
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
                  physics: _bouncingScrollPhysics,
                  padding: EdgeInsets.only(top: 108.0, bottom: 12.0),
                  children: snapshot.data.docs.map((document) { //getting data from snapshot as all documents and map document to item
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductPage(productId: document.id), //getting id of the product in firestore as String
                          ),
                        );
                      },
                      child: FutureBuilder(
                        future: _firebaseServices.productsReference.doc(document.id).get(),
                        builder: (context, productSnapshot) {
                          //create if statement, as no initial data is passed and return error 'data' was called on null
                          if(productSnapshot.hasError){
                            return Container(
                              child: Center(
                                child: Text("${productSnapshot.error}"),
                              ),
                            );
                          }

                          if(productSnapshot.connectionState == ConnectionState.done){
                            Map _productMap = productSnapshot.data.data();

                            return Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 24.0,
                                ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 90.0,
                                    width: 90.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        "${_productMap['images'][0]}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 16.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${_productMap['name']}",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: 4.0),
                                          child: Text(
                                            "€${_productMap['price']}",
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: Theme.of(context).accentColor,
                                              fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Chosen size - ${document.data()['size']}", //getting chosen size in firestore in database
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return Container(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );

                        },
                      ),
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
            hasBackArrow: true,
            title: "Cart",
          ),
        ],
      ),
    );
  }
}
