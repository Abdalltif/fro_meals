import 'dart:io';

import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fro_meals/common/constants.dart';
import 'package:fro_meals/common/helpers.dart';
import 'package:fro_meals/data/models/product.dart';
import 'package:fro_meals/presentation/product_details/product_details_screen.dart';
import 'package:fro_meals/presentation/search/components/search_appbar_content.dart';
import 'package:fro_meals/presentation/search/components/search_item_card.dart';
import 'package:fro_meals/presentation/search/search_viewmodel.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchBarController<Product> _searchBarController = SearchBarController();
  final SearchViewModel _viewModel = SearchViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // const Text(
          //   "Filters",
          //   style: TextStyle(color: Colors.black87, fontSize: 16),
          // ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SearchBar<Product>(
                onSearch: _viewModel.searchItems,
                textStyle: const TextStyle(color: Colors.black87, fontSize: 16),
                searchBarStyle: SearchBarStyle(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.only(left: 14, right: 14),
                    borderRadius: BorderRadius.circular(6)
                ),
                minimumChars: 2,
                scrollDirection: Axis.vertical,
                icon: Icon(FontAwesomeIcons.search, color: Colors.blue,),
                iconActiveColor: Colors.red,
                searchBarController: _searchBarController,
                hintText: 'Search products, brands',
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                placeHolder: Text("Search result", style: TextStyle(color: Colors.black87),),
                cancellationWidget: Text("Cancel", style: TextStyle(color: Colors.black87),),
                emptyWidget: Text("Check the name", style: TextStyle(color: Colors.black87), ),
                onCancelled: () {
                  print("Cancelled triggered");
                },
                mainAxisSpacing: 0,
                onItemFound: (Product product, int index) {
                  return GestureDetector(
                    child: SearchProductCard(product: product),
                    onTap: (){
                      Helpers.playClickSound();
                      goToProductScreen(context, product);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  goToProductScreen(BuildContext context, Product product){
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) => ProductDetailsScreen(product: product)
        )
    );
  }
}
