import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;

  Product(
      { this.image, this.title, this.description, this.price, this.size, this.id, this.color});
}

String dummyText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";

List<Product> products = [
    Product(
      id: 1,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/1.png",
      color: Color(0xFF3D82AE),
        ),
    Product(
        id: 2,
        title: "Belt Bag",
        price: 222,
        size: 8,
        description: dummyText,
        image: "assets/images/2.png",
        color: Color(0xFFD3A984)),
    Product(
        id: 3,
        title: "Hang Top",
        price: 199,
        size: 10,
        description: dummyText,
        image: "assets/images/3.png",
        color: Color(0xFF989493)),
    Product(
        id: 4,
        title: "Old Fashion",
        price: 99,
        size: 11,
        description: dummyText,
        image: "assets/images/4.png",
        color: Color(0xFFE6B398)),
    Product(
        id: 5,
        title: "Office Code 2",
        price: 689,
        size: 12,
        description: dummyText,
        image: "assets/images/5.png",
        color: Color(0xFFFB7883)),
    Product(
      id: 6,
      title: "Office Code",
      price: 333,
      size: 12,
      description: dummyText,
      image: "assets/images/6.png",
      color: Color(0xFFAEAEAE),
    ),
];

