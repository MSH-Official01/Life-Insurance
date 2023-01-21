import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import '../../Location/location.dart';
import '../../ProfilePage/profile_page.dart';


final List<String> imgList = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYrrvN6uhOj1VhCnmRXPZ7KlFb3rDqh0E-KQ&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMgX3LIhDkJIVBf5MzEv0kK1oFu8pzWIRkIg&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSL4WIIqeS1vJo3rMAp20lq66Q3jUbIxVSKQA&usqp=CAU'
];

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearched = false;
  var searchedData;
  var _selectedIndex = 0;
  PageController? _pageController;

  bool isLoading = false;
  int? _productIndex;

  final TextEditingController _searchController = TextEditingController();

  bool _searchBoolean = false;
  final List<int> _searchIndexList = [];
  var product = 0;

  List<String> _list = [
    'English Textbook',
    'Japanese Textbook',
    'English Vocabulary',
    'Japanese Vocabulary'
  ];

  @override
  Widget _searchTextField() {
    return TextField(
      onChanged: (String s) {
        // setState(() {
        //   _searchIndexList = [];
        //   for (int i = 0; i < _list.length; i++) {
        //     if (_list[i].contains(s)) {
        //       _searchIndexList.add(i);
        //     }
        //   }
        // });
      },
      autofocus: true,
      cursorColor: Colors.black,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        hintText: 'Search',
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _searchListView() {
    return ListView.builder(
        itemCount: _searchIndexList.length,
        itemBuilder: (context, index) {
          index = _searchIndexList[index];
          return Card(child: ListTile(title: Text(_list[index])));
        });
  }

  //Access confirmation dialog
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff057CAF),
          leading: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          centerTitle: true,
          title: !_searchBoolean
              ? Text(
                  "Metropolitan",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "JejuHallasan"),
                )
              : _searchTextField(),
          actions: !_searchBoolean
              ? [
                  IconButton(
                    icon: Icon(
                      Icons.notifications_rounded,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {},
                  ),
                  // SizedBox(
                  //   width: size.width * .02,
                  // ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      setState(() {
                        Future.delayed(Duration(microseconds: 500), () async {
                          _searchBoolean = true;
                        });

                        // _searchIndexList = [];

                        // Get.off(() =>  GrocerySearchPage());
                      });
                    },
                  ),
                  SizedBox(
                    width: size.width * .02,
                  ),
                ]
              : [
                  IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      setState(() {
                        Future.delayed(Duration(microseconds: 500), () async {
                          _searchBoolean = false;
                          _isSearched = false;
                        });
                      });
                    },
                  ),
                  SizedBox(width: size.width * .02),
                ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: imgList.length,
                options: CarouselOptions(
                  // enableInfiniteScroll: true,
                  // autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  initialPage: 0,
                  // autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlay: true,
                  aspectRatio: 16 / 10,
                  // autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 1.0,
                ),
                itemBuilder: (context, index, realIdx) {
                  return Container(
                    // height: size.height * 0.50,
                    // width: size.width,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(imgList[index].toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Colors.white,
          selectedIndex: _selectedIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            _pageController?.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);

            if (_selectedIndex == 0) {
              print("Home");
            } else if (_selectedIndex == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LocationPage()),
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
