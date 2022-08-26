import 'package:flutter/material.dart';

class ProductSize extends StatefulWidget {

  final List productSizes; //list of all retrieved sizes from database

  final Function(String) onSelected; //this function will send selected string of size, which can passed further to database

  ProductSize( {this.productSizes, this.onSelected} );

  @override
  _ProductSizeState createState() => _ProductSizeState();
}

class _ProductSizeState extends State<ProductSize> {

  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, bottom: 20.0),
      child: Row(
        children: [
          for(var i=0; i < widget.productSizes.length; i++) //loop to get all sizes of the product
              GestureDetector(
                onTap: () {
                  widget.onSelected("${widget.productSizes[i]}"); //passing selected size index of the size to product page
                  setState(() {
                    _selected = i;
                  });
                },
                child: Container(
                  width: 42.0,
                  height: 42.0,
                  decoration: BoxDecoration(
                    color: _selected == i ? Theme.of(context).accentColor : Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  alignment: Alignment.center, //alignment inside of the container
                  margin: EdgeInsets.symmetric(
                    horizontal: 4.0,
                  ),
                  child: Text(
                    "${widget.productSizes[i]}",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: _selected == i ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
