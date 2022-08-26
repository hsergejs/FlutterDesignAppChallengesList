import 'package:design_app_challenge_7/constants.dart';
import 'package:design_app_challenge_7/models/nav_item.dart';
import 'package:design_app_challenge_7/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double defaultSize = SizeConfig.defaultSize;

    return Consumer<NavItems>(
      builder: (context, NavItems, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: defaultSize * 3),
        //height: 80.0, //for dev UI purposes
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset( 0, -7),
              blurRadius: 30.0,
              color: Color(0xFF4B1A39).withOpacity(0.2),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: //not a list [] as value is passed already as a list
              List.generate(
                NavItems.items.length,
                (index) => _buildIconNavBarItem(
                  isActive: NavItems.selectedIndex == index ? true : false,
                  icon: NavItems.items[index].icon,
                  press: () {
                    NavItems.changeNavIndex(index: index);
                    //destination checker might not be required as all NavBar items will have screens
                    if(NavItems.items[index].destinationChecker()){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NavItems.items[index].destination,
                        ),
                      );
                    }
                  },
                ),
              ),
          ),
        ),
      ),
    );
  }

  IconButton _buildIconNavBarItem( {String icon, Function press, bool isActive = false} ) {
    return IconButton(
                icon: SvgPicture.asset(
                  icon,
                  color: isActive ? kPrimaryColor : Colors.grey[400],
                  height: 22.0,
                ),
                onPressed: press,
            );
  }
}
