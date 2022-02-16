
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fro_meals/common/constants.dart';
import 'package:fro_meals/presentation/browse/browse_screen.dart';
import 'package:fro_meals/presentation/home/home_screen.dart';
import 'package:fro_meals/presentation/main_container/components/app_drawer.dart';
import 'package:fro_meals/presentation/main_container/components/main_appbar_content.dart';
import 'package:fro_meals/presentation/scan/scan_screen.dart';
import 'package:fro_meals/presentation/search/search_screen.dart';
import 'package:toast/toast.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}



class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin{
  int _selectedScreen = 0;

  final _screenOptions = [
    const HomeScreen(),
    const ScanScreen(),
    const BrowseScreen(),
    const SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Image(
              image: AssetImage('images/logo-white.png'),
            ),
          ),
          backgroundColor: Constants.APP_BAR_COLOR,
        ),
        endDrawer: appDrawer(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(child: _screenOptions.elementAt(_selectedScreen)),
        ),
        bottomNavigationBar: ConvexAppBar(
          items: const [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.settings_overscan, title: 'Scan'),
            TabItem(icon: FontAwesomeIcons.cookieBite, title: 'Browse'),
            TabItem(icon: Icons.search, title: 'Search'),
          ],
          backgroundColor: Colors.white,
          color: Colors.grey[400],
          activeColor: Theme.of(context).primaryColor,
          initialActiveIndex: _selectedScreen,
          onTap: _onItemTapped,
          elevation: 1,
          style: TabStyle.react,
          height: 50,
          top: -15,
          curveSize: 110,
        )
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