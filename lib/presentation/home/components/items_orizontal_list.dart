
import 'package:flutter/material.dart';
import 'package:fro_meals/data/models/item.dart';
import 'package:fro_meals/presentation/home/components/item_card.dart';

class ItemsHorizontalList extends StatelessWidget {
  final String title ;
  final List<Item> items;

  ItemsHorizontalList({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:18.0, right: 8.0, top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(color: Colors.black87),),
              InkWell(
                onTap: (){

                },
                child: const Text("more...", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        Container(
          height: 120,
          padding: const EdgeInsets.only(right:8.0, left:8.0),
          margin: const EdgeInsets.only(top: 8.0),
          child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context,index){
                  return ItemCard(
                    item: items[index],
                    onPressed: (){

                    },
                  );
                }
              ) ,
        )
      ],
    );
  }
}