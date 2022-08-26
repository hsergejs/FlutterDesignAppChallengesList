import 'package:design_app_challenge_7/constants.dart';
import 'package:design_app_challenge_7/size_config.dart';
import 'package:flutter/material.dart';


//Category List require StateFull widget
//can be used together with Provider, thus no need in Statefull Widget

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  //Categories list
  List<String> categories = ["All", "Indian", "Italian", "Mexican", "Chinese"];
  //selected item by default is All
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize * 2),
      child: SizedBox(
        height: SizeConfig.defaultSize * 3.5, //35px
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context,index) => buildCategoryItem(index),
        ),
      ),
    );
  }

  Widget buildCategoryItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: SizeConfig.defaultSize * 2), //this will define each item and bckg color
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize * 2, //20px
          vertical: SizeConfig.defaultSize * 0.5, //5px
        ),
        decoration: BoxDecoration(
            color: selectedItem == index ? Color(0xFFEFF3EE) : Colors.transparent,
            borderRadius: BorderRadius.circular(SizeConfig.defaultSize * 1.6) //16px
        ),
        child: Text(
          categories[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedItem == index ? kPrimaryColor : Colors.grey,
          ),
        ),
      ),
    );
  }
}






