import 'package:flutter/material.dart';
import 'package:fro_meals/common/constants.dart';
import 'package:fro_meals/data/models/item.dart';

class ItemCard extends StatelessWidget {
  final Function onPressed;
  final Item item;

  ItemCard({required this.onPressed, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed(),
      child: Container(
        height: 55,
        width: 55,
        margin: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          gradient: LinearGradient(
              colors: [Color(0xff282b28),Color(0xff282b28)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.all(3),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          // height:MediaQuery.of(context).size.height ,
                          margin: EdgeInsets.all(0),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              item.name,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
