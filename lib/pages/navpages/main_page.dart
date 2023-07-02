// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cubit_app/pages/navpages/bar_item_page.dart';
import 'package:cubit_app/pages/navpages/home_page.dart';
import 'package:cubit_app/pages/navpages/profile_page.dart';
import 'package:cubit_app/pages/navpages/search_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    ProfilePage(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.cyan,
        elevation: 0,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.shifting,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Bar', icon: Icon(Icons.bar_chart)),
          BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
