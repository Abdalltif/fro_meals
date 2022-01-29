import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fro_meals/data/models/brand.dart';
import 'package:fro_meals/data/models/category.dart';

class BrandGridItem extends StatelessWidget {
  @required
  final Brand brand;

  BrandGridItem(this.brand);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                  image: NetworkImage(brand.imgUrl)
                ),
            ),
          ),
          Opacity(
            opacity: 0.80,
            child: Container(
              decoration: const BoxDecoration(
                // color: Colors.black45,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                gradient: LinearGradient(
                    colors: [Colors.black45, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            left: 8,
            child: Text(
              brand.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
