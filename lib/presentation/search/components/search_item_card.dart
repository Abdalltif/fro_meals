import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fro_meals/data/models/product.dart';
import 'package:fro_meals/presentation/product_details/product_details_screen.dart';

class SearchProductCard extends StatelessWidget {
  final Product product;

  SearchProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        goToProductScreen(context, product);
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.only(top: 12, bottom: 12, left: 15, right: 15),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 5,),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(product.imgUrl),
                  ),
                  const SizedBox(width: 20,),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                              product.name,
                              style: TextStyle(color: Colors.black87,fontSize: 16, fontWeight: FontWeight.normal)
                          ),
                        ),
                        SizedBox(height: 8,),
                        Container(
                          child: Text(
                              product.instructions,
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Colors.black54,fontSize: 14, fontWeight: FontWeight.normal)
                          ),
                        ),
                        SizedBox(height: 12,),
                        Row(
                          children: [
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.category,
                                  size: 14.0,
                                  color: Platform.isIOS ? Color(0xff6cae7a) : Theme.of(context).accentColor,
                                ),
                                const SizedBox(width: 5,),
                                const Text(
                                    "Pizza",
                                    style: TextStyle(color: Colors.black87,fontSize: 12, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic)
                                ),
                                const SizedBox(width: 20,),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.certificate,
                                  size: 14.0,
                                  color: Platform.isIOS ? Color(0xff6cae7a) : Theme.of(context).accentColor,
                                ),
                                const SizedBox(width: 5,),
                                const Text(
                                    "Brand",
                                    style: TextStyle(color: Colors.black87,fontSize: 12, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic)
                                ),
                                const SizedBox(width: 20,),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  goToProductScreen(BuildContext context, Product product) {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) => ProductDetailsScreen(product: product)
        )
    );
  }
}
