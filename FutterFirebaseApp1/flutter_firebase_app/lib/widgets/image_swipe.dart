import 'package:flutter/material.dart';

class ImageSwipe extends StatefulWidget {

  final List imageList;

  const ImageSwipe({Key key, this.imageList}) : super(key: key);

  @override
  _ImageSwipeState createState() => _ImageSwipeState();
}

class _ImageSwipeState extends State<ImageSwipe> {

  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      child: Stack(
        children: [
          PageView( //allow scrolling from left to right
            onPageChanged: (num) {
                setState(() {
                  _selectedPage = num;
                });
              },
            children: [
              for(var i=0; i < widget.imageList.length; i++) //no brackets, images to display
                Container(
                  child: Image.network(
                    "${widget.imageList[i]}",
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),
          Positioned(
            bottom: 20.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(var i=0; i < widget.imageList.length; i++) //navigator for images
                  AnimatedContainer( //at the begining used regular Container, then changed to AnimatedContainer
                    duration: Duration(
                      milliseconds: 300,
                    ),
                    curve: Curves.easeOutCubic,
                    width: _selectedPage == i ? 35.0 : 10.0, //set width of navigator container in current image
                    height: 10.0,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10.0), //matched with height to get exact rounding
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
