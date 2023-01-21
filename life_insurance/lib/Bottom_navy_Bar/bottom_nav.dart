import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../Fetures/Location/location.dart';
import '../Fetures/Main_Home/view/home_screen.dart';
import '../Fetures/ProfilePage/profile_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    HomePage(),
    // const HomeScreen(),
    LocationPage(),
    // const HomeScreen(),
    ProfilePage(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colo,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        // fixedColor: Colors.red,
        iconSize: 28,
        onTap: updatePage,
        items: [
          // HOME
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: const BoxDecoration(
                border: Border(
                    // top: BorderSide(
                    //   color: _page == 0
                    //       ? Appcolor.selectedNavBarColor
                    //       : Appcolor.backgroundColor,
                    //   //width: bottomBarBorderWidth,
                    // ),
                    ),
              ),
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(),
              ),
              child: Badge(
                elevation: 0,
                badgeContent: Text(
                  3.toString(),
                  style: TextStyle(
                    color: _page == 1 ? Colors.blue : Colors.grey,
                    fontSize: 15,
                  ),
                ),
                badgeColor: Colors.blue,
                child: Icon(
                  Icons.location_on_outlined,
                ),
              ),
            ),
            label: 'Location',
          ),

          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(),
              ),
              child: Icon(
                Icons.person,
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
