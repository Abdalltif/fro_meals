

import 'package:fro_meals/data/models/item.dart';
import 'package:fro_meals/domain/repositories/search_repository.dart';

class MockSearchRepositoryImpl extends SearchRepository {


  @override
  Future<List<Item>> searchItems(String name) async {
    await Future.delayed(const Duration(seconds: 2));
    List<Item> items = [];

    items.add(Item("Nuggets", "instruction 1 2 3 4 5 6", "https://www.keventer.com/wp-content/themes/keventer/images/frozen-img2.jpg"));
    items.add(Item("product 1", "instruction 1 2 3 4", "https://www.matthews.com.au/upload/images/frozen-food-2.jpg"));
    items.add(Item("product 1", "instruction 1 2 3 4", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9WXWJthiF_A-6RQhblsYCJw1iHiYFY-nFHw&usqp=CAU"));
    items.add(Item("Nuggets", "instruction 1 2 3 4 5 6", "https://www.keventer.com/wp-content/themes/keventer/images/frozen-img2.jpg"));
    items.add(Item("Nuggets", "instruction 1 2 3 4 5 6", "https://www.keventer.com/wp-content/themes/keventer/images/frozen-img2.jpg"));

    return items;
  }

}