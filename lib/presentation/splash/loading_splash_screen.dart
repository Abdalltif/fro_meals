import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fro_meals/presentation/main_container/main_screen.dart';


class LoadingSplashScreen extends StatefulWidget {
  const LoadingSplashScreen({Key? key}) : super(key: key);


  @override
  _LoadingSplashScreenState createState() => _LoadingSplashScreenState();
}

class _LoadingSplashScreenState extends State<LoadingSplashScreen> {
  late double _height;
  late double _width;


  @override
  void initState() {
    _height = 120;
    _width = 120;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _animateLogo();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffffffff),
                  Color(0xffffffff),
                ]
            )
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.2),
          child: Column(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 1200),
                curve: Curves.bounceOut,
                width: _width,
                height: _height,
                child: Padding(
                  padding: const EdgeInsets.only(top: 48, bottom: 8),
                  child: Image.asset(
                    'images/logo.png',
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _goToHomeScreen(BuildContext context) async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.of(context).pop();
      Navigator.push(
          context,
          MaterialPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) => const MainScreen()
          )
      );
    });
  }

  _animateLogo() async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      _goToHomeScreen(context);
    });
    if (mounted) {
      if(_height<222){
        setState(() {
          _height = 222;
          _width = 222;
        });
      }
    }
  }
}

