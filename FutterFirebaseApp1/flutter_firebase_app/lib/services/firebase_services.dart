

//as app is quite small we use only one _services.dart
//but if app is large use firebase_auth_services.dart, firebase_firestore_service.dart and etc.dynamic

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  //init firebase auth instance
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //init firestore
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //getting current user id
  String getUserId() {
    return _firebaseAuth.currentUser.uid;
  }

  //collection used for products
  final CollectionReference productsReference = FirebaseFirestore.instance.collection("Products"); //name of the collection
  //collection of users to save cart contents
  final CollectionReference userReference = FirebaseFirestore.instance.collection("Users");

  //collection of current user Cart
  final CollectionReference productReferenceCart = FirebaseFirestore.instance.collection("Users");


}