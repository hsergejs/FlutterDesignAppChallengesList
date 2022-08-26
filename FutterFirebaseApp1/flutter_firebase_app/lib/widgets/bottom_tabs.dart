import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BottomTabs extends StatefulWidget {

  final int selectedTab; //passed value from page
  final Function(int) tabPressed;

  const BottomTabs({Key key, this.selectedTab, this.tabPressed}) : super(key: key);

  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedTab = 0; //used for styling of active tab

  @override
  Widget build(BuildContext context) {

    //set in buid instead of initState()
    _selectedTab = widget.selectedTab ?? 0 ; //if selected tab of the overall widget selected tab is null, set value to 0

    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1.0,
            blurRadius: 30.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomTabBtn(
            imagePath: "assets/icons/tab_home.png",
            selected: _selectedTab == 0 ? true : false,
            press: () {
              widget.tabPressed(0);
            },
          ),
          BottomTabBtn(
            imagePath: "assets/icons/tab_search.png",
            selected: _selectedTab == 1 ? true : false,
            press: () {
              widget.tabPressed(1);
            },
          ),
          BottomTabBtn(
            imagePath: "assets/icons/tab_saved.png",
            selected: _selectedTab == 2 ? true : false,
            press: () {
              widget.tabPressed(2);
            },
          ),
          BottomTabBtn(
            imagePath: "assets/icons/tab_logout.png",
            selected: _selectedTab == 3 ? true : false,
            press: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}

class BottomTabBtn extends StatelessWidget {

  final String imagePath;
  final bool selected;
  final Function press;

  const BottomTabBtn({Key key, this.imagePath, this.selected = false, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 24.0),
        decoration: BoxDecoration( //decorate selected item
          border: Border( //using border
            top: BorderSide(
              color: selected ? Theme.of(context).accentColor : Colors.transparent, //and theme defaults
              width: 2.0,
            ),
          ),
        ),
        child: Image(
          image: AssetImage(
            imagePath,
          ),
          width: 22.0,
          height: 22.0,
          color: selected ? Theme.of(context).accentColor : Colors.black,
        ),
      ),
    );
  }
}

