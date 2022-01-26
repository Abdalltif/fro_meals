import 'package:flutter/material.dart';
import 'package:fro_meals/data/models/item.dart';
import 'package:fro_meals/presentation/home/components/items_orizontal_list.dart';
class MainLists extends StatelessWidget {
  final String title ;
  final List<Item> items;

  MainLists({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: ItemsHorizontalList(title: title, items: items),
    );
  }
}
