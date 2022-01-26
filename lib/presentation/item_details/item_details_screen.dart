import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fro_meals/common/helpers.dart';

class ItemDetailsScreen extends StatelessWidget {

  String url = "https://i.pinimg.com/originals/d3/8d/9e/d38d9ed450f76d0b08995e85d9c1c976.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300.0),
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Image.network(url, fit: BoxFit.cover),
            ),
            Container(
              color: Colors.black12,
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 4),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                iconSize: 25,
                color: Colors.white,
                onPressed: () async {
                  Helpers.playClickSound();
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 18.0, top: 10),
              child: Text('Frozen Kabab', style: TextStyle(color: Colors.black87, fontSize: 24),),
            ),
            const Text("Haldiram's combines great taste and good health in its new Kebab Range", style: TextStyle(color: Colors.black54, fontSize: 16, fontStyle: FontStyle.italic),),
            const SizedBox(height: 20,),
            const Text("Kabab . Onion . Tomato", style: TextStyle(color: Colors.black87, fontSize: 16,),),

            Opacity(
              opacity: 0.5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Divider(
                  height: 2,
                  thickness: 0.5,
                  color: Colors.grey,
                  endIndent: MediaQuery.of(context).size.width*.4,
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text('Instructions', style: TextStyle(color: Colors.black87, fontSize: 20),),
            ),
            const Text('1- Remove all packaging', style: TextStyle(color: Colors.black54, fontSize: 16, fontStyle: FontStyle.italic),),
            const Text('2- Leave it 10 minutes ', style: TextStyle(color: Colors.black54, fontSize: 16, fontStyle: FontStyle.italic),),
            const Text('3- prepare the microwave at 180 C', style: TextStyle(color: Colors.black54, fontSize: 16, fontStyle: FontStyle.italic),),
          ],
        ),
      ),
    );
  }
}
