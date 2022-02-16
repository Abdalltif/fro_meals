import 'package:flutter/material.dart';
import 'package:fro_meals/common/helpers.dart';

class MoreListAppBarContent extends StatefulWidget {
  final String title ;
  const MoreListAppBarContent({required this.title});

  @override
  State<MoreListAppBarContent> createState() => _MoreListAppBarContentState();
}

class _MoreListAppBarContentState extends State<MoreListAppBarContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back),
            iconSize: 25,
            color: Colors.white,
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(width: 20,),
          Text(
            widget.title,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}