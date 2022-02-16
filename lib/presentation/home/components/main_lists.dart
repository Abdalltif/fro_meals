import 'package:flutter/material.dart';
import 'package:fro_meals/data/models/product.dart';
import 'package:fro_meals/presentation/home/components/product_orizontal_list.dart';
class MainLists extends StatelessWidget {
  final String title ;
  final List<Product> products;

  MainLists({required this.title, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: ItemsHorizontalList(title: title, products: products),
    );
  }
}
