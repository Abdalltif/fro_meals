import 'package:flutter/material.dart';
import 'package:fro_meals/common/constants.dart';
import 'package:fro_meals/data/models/product.dart';
import 'package:fro_meals/presentation/home/components/more_list_appbar_content.dart';
import 'package:fro_meals/presentation/search/components/search_item_card.dart';


class MoreListScreen extends StatefulWidget {
  final String title ;
  final List<Product> products;

  MoreListScreen({required this.title, required this.products});

  @override
  State<MoreListScreen> createState() => _MoreListScreenState();
}

class _MoreListScreenState extends State<MoreListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Constants.APP_BAR_COLOR,
          ),
          child: MoreListAppBarContent(title: widget.title),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(right:8.0, left:8.0),
        margin: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: widget.products.length,
            itemBuilder: (context,index){
              return SearchProductCard(
                product: widget.products[index]
              );
            }
        ) ,
      ),
    );
  }
}
