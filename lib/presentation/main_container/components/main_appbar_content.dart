import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fro_meals/presentation/search/search_screen.dart';

class MainAppBarContent extends StatefulWidget {
  const MainAppBarContent({Key? key}) : super(key: key);

  @override
  State<MainAppBarContent> createState() => _MainAppBarContentState();
}

class _MainAppBarContentState extends State<MainAppBarContent> {
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
                  FontAwesomeIcons.search,
                  size: 24,
                ),
                color: Colors.white,
                onPressed: () {
                  goToSearchItems();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void goToSearchItems() {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) => const SearchScreen()
        )
    );
  }
}