import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false, //debugging in development, by default is true, eat a lot resources on diag thus in release set to false
  home: DesignAppChallenge1(),
));

class DesignAppChallenge1 extends StatefulWidget {
  @override
  _DesignAppChallenge1State createState() => _DesignAppChallenge1State();
}

class _DesignAppChallenge1State extends State<DesignAppChallenge1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: new AppBar(
        title: new FlutterLogo( //logo in appBar
          textColor: Colors.green,
          size: 25.0,
        ),
        elevation: 0.0,
        //shadow under appBar
        centerTitle: true,
        //center items in appBar
        backgroundColor: Colors.white,
        leading: new IconButton( //back button in appBar on the left side of appBar
          onPressed: () {},
          icon: new Icon(Icons.arrow_back_rounded),
          //type of icon for back button
          color: Colors.grey,
        ),
        actions: [ //menu button on the right side of the appBar
          new IconButton(
            icon: new Icon(Icons.menu_rounded),
            color: Colors.grey,
            onPressed: () {},
          ),
        ],
      ),
      body: new ListView( //container after appBar with Title
        shrinkWrap: true,
        //listView will took only required space by items, but will scroll/expand if items are added
        children: [
          new Stack( //allow to stack objects inside - provide disposition from container
            children: [
              new Container( //container right after appBarr with title
                alignment: new Alignment(0.0, -0.4),
                //can be done and usually done by mainAxisAlignment and crossAxisAlignment
                height: 120,
                color: Colors.white,
                child: new Text(
                  'Get Coaching',
                  style: new TextStyle(
                    fontFamily: 'Montserrat Alternates',
                    fontSize: 20.0,
                  ),
                ),
              ),
              new Container( //container with 'you have' and 'buy more' button
                margin: new EdgeInsets.fromLTRB(25.0, 70.0, 25.0, 0.0),
                decoration: new BoxDecoration( //allow to use color and etc.
                  color: Colors.white,
                  border: new Border.all(
                    color: Colors.transparent,
                  ),
                  borderRadius: new BorderRadius.circular(20.0), //rounded edges
                  boxShadow: [ //note it's a list
                    new BoxShadow(
                      blurRadius: 0.2,
                      color: Colors.grey.withOpacity(0.01),
                      offset: Offset(0.0, 4.0),
                    ),
                  ],
                ),
                child: new Row( //start of the text and button
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack( //used stack as containers will have too large padding inside
                      children: [
                        new Container( //text container
                          padding: new EdgeInsets.fromLTRB(
                              0.0, 25.0, 5.0, 5.0),
                          child: new Text(
                            'YOU HAVE',
                            style: new TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        new Container( //counter container
                          padding: new EdgeInsets.fromLTRB(
                              0.0, 40.0, 5.0, 25.0),
                          child: new Text(
                            '206',
                            style: new TextStyle(
                              color: Colors.black,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 40.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    new GestureDetector(
                      onTap: () {
                        print('tapped');
                      },
                      child: new Container( //simulation of the button
                        height: 50.0,
                        width: 125.0,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent[100].withOpacity(0.5),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: new Center( //text in the button
                          child: new Text(
                            'Buy More',
                            style: new TextStyle(
                                color: Colors.green,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          new SizedBox(height: 40.0,),
          new Container(
            padding: new EdgeInsets.only(left: 25.0, right: 25.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //allow to evenly arrange space between children
              children: [
                new Text(
                  'MY COACHES',
                  style: new TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),
                new Text(
                  'VIEW PAST SESSIONS',
                  style: new TextStyle(
                    color: Colors.green,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
          new SizedBox(height: 10.0),
          new GridView
              .count( //grid view with specific amount of elements per row
            crossAxisCount: 2,
            //state amount of elements per row
            primary: false, //enabling scrolling of gridView element, by default it's not scrollable
            crossAxisSpacing: 2.0,
            //spacing between elements IN A ROW
            mainAxisSpacing: 4.0,
            // spacing between elements IN A COLUMN
            shrinkWrap: true,
            children: [
              _buildCard('Sergejs', 'Available', 1, 'imgUrl'),
              _buildCard('Tom', 'Away', 2, 'imgUrl'),
              _buildCard('Ashley', 'Available', 3, 'imgUrl'),
              _buildCard('Gregorzh', 'Away', 4, 'imgUrl'),
              _buildCard('Ekaterina', 'Away', 5, 'imgUrl'),
              _buildCard('Fillip', 'Available', 6, 'imgUrl'),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildCard(String name, String status, int index, String imgUrl) {
    String _imgUrl = 'https://yt3.ggpht.com/ytc/AAUvwngw35YY8vYI86RTOoEGafSxEjghjzTcKw3LbMyZ=s900-c-k-c0x00ffffff-no-rj';
    return new Card( //whole card pattern
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
      elevation: 7.0,
      child: new Column(
        children: [
          new SizedBox(height: 15.0),
          new Stack(
              children: [
                new Container( //image/avatar container
                  height: 60.0,
                  width: 60.0,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(30.0),
                    color: Colors.green,
                    image: new DecorationImage(
                      image: new NetworkImage(_imgUrl),
                    ),
                  ),
                ),
                new Container( //availability circle, small circle on Image
                  margin: new EdgeInsets.only(left: 35.0),
                  height: 20.0,
                  width: 20.0,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(40.0),
                    color: status == 'Away' ? Colors.amber : Colors.green,
                    border: new Border.all(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 4.0,
                    ),
                  ),
                ),
                new SizedBox(height: 8.0),
                Container(
                  child: new Text(
                    name, //actual name txt passed in
                    style: new TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                new SizedBox(height: 5.0),
                Container(
                  child: new Text(
                    status, //actual status txt passed in
                    style: new TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
                new SizedBox(height: 15.0),
                Container(
                  child: new Expanded( //expand container on all available space
                      child: new Container(
                        width: 175.0,
                        decoration: new BoxDecoration(
                          color: status == 'Away' ? Colors.grey : Colors.green,
                          borderRadius: new BorderRadius.only( //provide only specific edges round this done as button Container will overlay Card as using Stack
                              bottomLeft: new Radius.circular(10.0),
                              bottomRight: new Radius.circular(10.0),
                          ),
                        ),
                        child: new Center(
                          child: new Text(
                              'Request',
                            style: new TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ),
                ),
              ],
          ),
        ],
      ),
    );
  }
}