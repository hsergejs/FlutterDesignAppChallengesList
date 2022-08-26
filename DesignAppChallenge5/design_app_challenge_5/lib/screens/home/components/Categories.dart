import 'package:design_app_challenge_5/models/Categories.dart';
import 'package:design_app_challenge_5/screens/home/components/category_card.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key key,
    this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: //HIGHLY IMPORTANT DON'T USE [] AS RETURNING TYPE ALREADY A LIST
        List.generate(
          categories.length,
              (index) => CategoryCard(
            category: categories[index],
          ),
        ),
      ),
    );
  }
}
