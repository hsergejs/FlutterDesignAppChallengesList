import 'package:flutter/material.dart';

class RecepieBundle{
  final int id,chefs,recepies;
  final String title,description,imageSrc;
  final Color color;

  RecepieBundle( {this.id, this.chefs, this.recepies, this.title, this.description, this.imageSrc, this.color} );

}

// Demo list
List<RecepieBundle> recepieBundles = [
  RecepieBundle(
    id: 1,
    chefs: 16,
    recepies: 95,
    title: "Cook Something New Everyday",
    description: "New and tasty recipes every minute",
    imageSrc: "assets/images/cook_new@2x.png",
    color: Color(0xFFD82D40),
  ),
  RecepieBundle(
    id: 2,
    chefs: 8,
    recepies: 26,
    title: "Best of 2020",
    description: "Cook recipes for special occasions",
    imageSrc: "assets/images/best_2020@2x.png",
    color: Color(0xFF90AF17),
  ),
  RecepieBundle(
    id: 3,
    chefs: 10,
    recepies: 43,
    title: "Food Court",
    description: "What's your favorite food dish make it now",
    imageSrc: "assets/images/food_court@2x.png",
    color: Color(0xFF2DBBD8),
  ),
];