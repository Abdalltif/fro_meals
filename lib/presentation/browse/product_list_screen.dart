import 'package:flutter/material.dart';
import 'package:fro_meals/common/constants.dart';
import 'package:fro_meals/data/models/product.dart';
import 'package:fro_meals/data/repositories/mock/mock.dart';
import 'package:fro_meals/presentation/home/components/more_list_appbar_content.dart';
import 'package:fro_meals/presentation/search/components/search_item_card.dart';

class ProductListScreen extends StatefulWidget {
  final int categoryId;
  final String title;

  ProductListScreen({required this.categoryId, required this.title});

  @override
  State<ProductListScreen> createState() => _ProductListScreen();
}

class _ProductListScreen extends State<ProductListScreen> {
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
      body: FutureBuilder(
        future: MockData.getProducts(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> products) {
          if (!products.hasData) {
            return const Padding(
              padding: EdgeInsets.all(80.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          return Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(right:8.0, left:8.0),
            margin: const EdgeInsets.only(top: 8.0),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: products.data!.length,
                itemBuilder: (context,index){
                  return SearchProductCard(product: products.data![index]);
                }
            ) ,
          );
        }
      ),
    );
  }
}
