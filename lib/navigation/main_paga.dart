import 'package:flutter/material.dart';
import 'package:travel_app/navigation/bar_page.dart';
import 'package:travel_app/navigation/home_page.dart';
import 'package:travel_app/navigation/profile_page.dart';
import 'package:travel_app/navigation/search_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pageList = [
    HomePage(),
    BarPage(),
    SearchPage(),
    ProfilePage(),
  ];

  int currentIndex = 0;

  void onTap(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pageList[0],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          currentIndex: currentIndex,
          elevation: 5,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.withOpacity(0.7),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_sharp), label: 'Bars'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_sharp), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_sharp), label: 'Profile'),
          ]),
    );
  }
}
