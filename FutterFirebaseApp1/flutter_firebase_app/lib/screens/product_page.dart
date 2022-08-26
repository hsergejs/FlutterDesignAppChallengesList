import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/constants.dart';
import 'package:flutter_firebase_app/services/firebase_services.dart';
import 'package:flutter_firebase_app/widgets/custom_action_bar.dart';
import 'package:flutter_firebase_app/widgets/image_swipe.dart';
import 'package:flutter_firebase_app/widgets/product_size.dart';

class ProductPage extends StatefulWidget {
  final String productId; //getting passed as parameter from which we could full product details

  ProductPage({Key key, this.productId}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
    //initialise to get user ID
    FirebaseServices _firebaseServices = FirebaseServices();

    BouncingScrollPhysics _bouncingScrollPhysics = BouncingScrollPhysics(); //init physics

  //collection used for products, moved to FirebaseServices()
  //final CollectionReference _productsReference = FirebaseFirestore.instance.collection("Products"); //name of the collection
  //collection of users to save cart contents
  //final CollectionReference _userReference = FirebaseFirestore.instance.collection("Users");
  //get user instance from firebaseAuth
  //User _currentUser = FirebaseAuth.instance.currentUser; //commented as we have access from FirebaseServices
  //setting product size variable, to get from function in product_size.dart
  String _selectedProductSize = "0";


  Future<void> _addToCart() {
    //create collection in firebase 'users', add user id, then create another collection 'cart' and add product id and then add info in to the table
    //User -> UserID (document) -> Cart -> productID (document)
    //return _userReference.doc(_currentUser.uid).collection("Cart").doc(widget.productId).set(
    //commented as moved to FirebaseServices()
    //return _userReference.doc(_firebaseServices.getUserId()).collection("Cart").doc(widget.productId).set(
    return _firebaseServices.userReference.doc(_firebaseServices.getUserId()).collection("Cart").doc(widget.productId).set(
      {
        "size" : _selectedProductSize, //passing value to store it in database
      }
    );
  }

    Future<void> _addToSaved() {
      //create collection in firebase 'users', add user id, then create another collection 'cart' and add product id and then add info in to the table
      //User -> UserID (document) -> Cart -> productID (document)
      //return _userReference.doc(_currentUser.uid).collection("Cart").doc(widget.productId).set(
      //commented as moved to FirebaseServices()
      //return _userReference.doc(_firebaseServices.getUserId()).collection("Cart").doc(widget.productId).set(
      return _firebaseServices.userReference.doc(_firebaseServices.getUserId()).collection("Saved").doc(widget.productId).set(
          {
            "size" : _selectedProductSize, //passing value to store it in database
          }
      );
    }

  final SnackBar _snackBar = SnackBar( //default widget show message at the bottom the screen
      content: Text(
          "Product added to cart!",
      ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            //future: _productsReference.doc(widget.productId).get(),
            future: _firebaseServices.productsReference.doc(widget.productId).get(),
            builder: (context, snapshot) {

              if (snapshot.hasError) {
                //for check setup purposes check for received snapshot on errors
                print("Error: ${snapshot.error}");
              }

              if(snapshot.connectionState == ConnectionState.done){

                //all data from firebase as document type
                Map<String, dynamic> documentData = snapshot.data.data(); // dynamic type - means can be any type of data, snapshot.data is from connection state,error etc, second data() for data it's self

                //list of all images in product
                List imageList = documentData["images"];
                //list of sizes
                List productSizes = documentData["size"];

                //set default size, as when loading setting 0 instead of actuall size
                _selectedProductSize = productSizes[0];

                return ListView(
                    physics: _bouncingScrollPhysics, //add bouncing physics a the front and the back, top bottom
                    padding: EdgeInsets.all(0.0),
                    children: [
                      ImageSwipe(imageList: imageList),
                      Padding(
                        padding: EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0, bottom: 4.0),
                        child: Text(
                          "${documentData['name']}",
                          style: Constants.boldHeading,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                        child: Text(
                          "€${documentData['price']}",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                        child: Text(
                          "${documentData['desc']}",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
                        child: Text(
                          "Select Size",
                          style: Constants.regularDarkText,
                        ),
                      ),
                        ProductSize(
                          productSizes: productSizes,
                          onSelected: (size) {
                            _selectedProductSize = size; //getting from onTap function size value as String
                          },
                        ),
                      Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await _addToSaved(); //adding to cart
                                Scaffold.of(context).showSnackBar(_snackBar); //show message to the user
                              },
                              child: Container(
                                width: 65.0,
                                height: 65.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Image(
                                    image: AssetImage(
                                        "assets/icons/tab_saved.png",
                                    ),
                                  height: 22.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  await _addToCart(); //adding to cart
                                  Scaffold.of(context).showSnackBar(_snackBar); //show message to the user
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 16.0),
                                  height: 65.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Add To Cart",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
              }

              //loading state
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          CustomActionBar(
            hasBackArrow: true,
            hasTitle: false,
            hasBackground: false,
          ),
        ],
      ),
    );
  }
}
