import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fro_meals/common/constants.dart';
import 'package:fro_meals/presentation/home/home_screen.dart';
import 'package:fro_meals/presentation/scan/scan_screen.dart';
import 'package:fro_meals/presentation/search/search_screen.dart';
import 'package:toast/toast.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class AppBarContent extends StatelessWidget {
  const AppBarContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          child: Row(
            children: <Widget>[
              const Image(
                image: AssetImage('images/logo-white.png'),
                height: 40,
              ),
              // Text(
              //   'FroMeals',
              //   style: TextStyle(color: Colors.white),
              // ),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 24,
                ),
                color: Colors.white,
                onPressed: () async {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin{
  int _selectedScreen = 0;

  final _screenOptions = [
    const HomeScreen(),
    const ScanScreen(),
    const SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Constants.PAGE_BG_COLOR,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Constants.APP_BAR_COLOR,
            ),
            child:  const AppBarContent(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(child: _screenOptions.elementAt(_selectedScreen)),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Scan'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Search'
            ),
          ],
          backgroundColor: Colors.white,
          currentIndex: _selectedScreen,
          type: BottomNavigationBarType.fixed,
          iconSize: 22,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey[400],
          elevation: 2,
          onTap: _onItemTapped,
        ),
      )
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  late DateTime currentBackPressTime;
  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Toast.show("اضغط رجوع مرة اخرى للخروج.", context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
      return Future.value(false);
    }
    return Future.value(true);
  }
}