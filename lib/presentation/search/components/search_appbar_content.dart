import 'package:flutter/material.dart';
import 'package:fro_meals/common/helpers.dart';
import 'package:fro_meals/presentation/search/search_screen.dart';

class SearchAppBarContent extends StatefulWidget {
  const SearchAppBarContent({Key? key}) : super(key: key);

  @override
  State<SearchAppBarContent> createState() => _SearchAppBarContentState();
}

class _SearchAppBarContentState extends State<SearchAppBarContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back),
            iconSize: 25,
            color: Colors.white,
            onPressed: () async {
              Helpers.playClickSound();
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(width: 20,),
          const Text(
            'Search',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
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