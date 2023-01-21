import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Main_Home/view/home_screen.dart';
import '../ProfilePage/profile_page.dart';
class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  var _selectedIndex = 1;
  PageController? _pageController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Colors.white,
          selectedIndex: _selectedIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            _pageController?.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);

            if (_selectedIndex == 1) {
              print("Home");
            } else if (_selectedIndex == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            } else if (_selectedIndex == 2) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            }
          }),
          items: [
            BottomNavyBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
              activeColor: Colors.black,
            ),
            BottomNavyBarItem(
                icon: const Icon(Icons.location_on_outlined),
                title: const Text('Location'),
                activeColor: Colors.black),
            BottomNavyBarItem(
                icon: const Icon(Icons.person),
                title: const Text('Profile'),
                activeColor: Colors.black),
          ],
        ),
      ),
    );
  }
}
