import 'package:flutter/material.dart';

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
              const Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 24,
                ),
                color: Colors.white,
                onPressed: () {
                  // todo: drawer
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}