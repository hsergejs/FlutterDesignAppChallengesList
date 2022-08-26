import 'package:design_app_challenge_7/screens/home/home_screen.dart';
import 'package:design_app_challenge_7/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class NavItem {
  final int id;
  final String icon;
  final Widget destination;

  NavItem( {this.id, this.icon, this.destination} );

  //if no destination
  bool destinationChecker(){
   if(destination != null) {
     return true;
   }
   else{
     return false;
   }
  }
}

//use Provider which listens on any changes and will rebuild our BottomNavBar on these changes
class NavItems extends ChangeNotifier {
  //first item in list is active
  int selectedIndex = 0;

  void changeNavIndex( {int index} ) {
    selectedIndex = index;

    //if any changes are made this method notify all widgets that use this value
    notifyListeners();
  }

  List<NavItem> items = [
    NavItem(
      id: 1,
      icon: "assets/icons/home.svg",
      destination: HomeScreen(),
    ),
    NavItem(
      id: 2,
      icon: "assets/icons/list.svg",
    ),
    NavItem(
      id: 3,
      icon: "assets/icons/camera.svg",
    ),
    NavItem(
      id: 4,
      icon: "assets/icons/chef_nav.svg",
    ),
    NavItem(
      id: 5,
      icon: "assets/icons/user.svg",
      destination: ProfileScreen(),
    ),
  ];
}