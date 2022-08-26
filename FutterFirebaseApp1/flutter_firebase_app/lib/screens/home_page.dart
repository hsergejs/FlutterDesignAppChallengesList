import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/tabs/home_tab.dart';
import 'package:flutter_firebase_app/tabs/saved_tab.dart';
import 'package:flutter_firebase_app/tabs/search_tab.dart';
import 'package:flutter_firebase_app/widgets/bottom_tabs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PageController _tabsPageController;

  int _selectedTab = 0; //will hold value from page controller for bottom tabs

  @override
  void initState() {
    _tabsPageController = PageController(); //init controller before screen is logged in
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose(); //dispose it
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView( //allow to show pages on pressed tab menu, SWIPING THEM TO SIDES
              controller: _tabsPageController, //will allow to connect bottom tabs with swiping screens
              onPageChanged: (num) { //get number whenever screen is changed
                setState(() {
                  _selectedTab = num;
                });
              },
              children: [ //it's all tabs, not pages!!!
                HomeTab(),
                SearchTab(),
                SavedTab(),
              ],
            ),
          ),
         BottomTabs(
           selectedTab: _selectedTab,
           tabPressed: (num) {
             setState(() {
               _tabsPageController.animateToPage(
                   num, //page number
                   duration: Duration(milliseconds: 300),
                   curve: Curves.easeOutCubic);
             });
           },
         ),
        ],
      ),
    );
  }
}
