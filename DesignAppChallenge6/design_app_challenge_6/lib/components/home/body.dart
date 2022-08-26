import 'package:design_app_challenge_6/components/home/food_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin { //required to use TabBar using 'with'

  TabController tabController;

  @override
  void initState() { //required to update and build TABS
    super.initState();
    tabController = new TabController(length: 4, vsync: this); //tabcontroller length must be equal to amount of tabs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Food App Some elements"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: new ListView(
        children: [
          Padding(
              padding: EdgeInsets.all(15.0),
              child: new Text(
                "SEARCH FOR",
                style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 17.0,
                ),
              ),
          ),
          new SizedBox(height: 25.0),
          new Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: new Container(
              padding: new EdgeInsets.only(left: 5.0),
              decoration: new BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: new TextField(
                decoration: new InputDecoration(
                  hintText: "Search",
                  hintStyle: GoogleFonts.notoSans(fontSize: 14.0),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(0.5),
                  prefix: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
          ),
          new SizedBox(height: 10.0),
          new Padding( //TabBar extends
              padding: new EdgeInsets.only(left: 15.0),
              child: new TabBar(
                controller: tabController,
                isScrollable: true,
                indicatorColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey.withOpacity(0.5),
                labelStyle: GoogleFonts.notoSans(fontSize: 16.0, fontWeight: FontWeight.w700),
                unselectedLabelStyle: GoogleFonts.notoSans(fontSize: 12.0, fontWeight: FontWeight.w500),
                tabs: [ //amount of tabs length in tabcontroller
                  Tab(
                      child: new Text("FEATURED"),
                  ),
                  Tab(
                    child: new Text("COMBO"),
                  ),
                  Tab(
                    child: new Text("FAVORITES"),
                  ),
                  Tab(
                    child: new Text("RECOMMENDED"),
                  ),
                ],
              ),
          ),
          new Container(
            height: MediaQuery.of(context).size.height - 450,
            child: TabBarView(
              controller: tabController,
              children: [
                new FoodTab(),
                new FoodTab(),
                new FoodTab(),
                new FoodTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
