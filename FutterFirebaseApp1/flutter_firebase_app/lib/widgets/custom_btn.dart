import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {

  final String txt;
  final Function press;
  final bool outlineBtn;

  final bool isLoading;

  const CustomBtn({Key key, this.txt, this.press, this.outlineBtn = false, this.isLoading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        //padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        height: 60.0,
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: outlineBtn ? Colors.transparent : Colors.black,
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          children: [
            Visibility( //visibility widget
              visible: isLoading ? false : true,
              child: Center(
                child: Text(
                  txt ?? "Default Text", //if txt value is null txt value is "Default Text"
                  style: TextStyle(
                    fontSize: 16.0,
                    color: outlineBtn ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isLoading,
              child: Center(
                child: SizedBox( //to size progress indicator
                  height: 30.0,
                  width: 30.0,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
