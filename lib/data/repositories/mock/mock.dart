import 'package:fro_meals/data/models/category.dart';
import 'package:fro_meals/data/models/product.dart';
import 'package:fro_meals/data/models/main_list_model.dart';

class MockData {

  static List<Product> getLastScannedItems(){
    List<Product> items = [];

    items.add(Product("Nuggets", "instruction 1 2 3 4 5 6", "https://www.keventer.com/wp-content/themes/keventer/images/frozen-img2.jpg"));
    items.add(Product("product 1", "instruction 1 2 3 4", "https://www.matthews.com.au/upload/images/frozen-food-2.jpg"));
    items.add(Product("product 1", "instruction 1 2 3 4", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9WXWJthiF_A-6RQhblsYCJw1iHiYFY-nFHw&usqp=CAU"));
    items.add(Product("Nuggets", "instruction 1 2 3 4 5 6", "https://www.keventer.com/wp-content/themes/keventer/images/frozen-img2.jpg"));
    items.add(Product("Nuggets", "instruction 1 2 3 4 5 6", "https://www.keventer.com/wp-content/themes/keventer/images/frozen-img2.jpg"));

    return items;
  }

  static List<Product> getBrowseBrands(){
    List<Product> items = [];

    items.add(Product("Frozen", "instruction 1 2 3 4 5 6", "https://i.pinimg.com/originals/7c/3c/6a/7c3c6ac2530d164c3ecfadf2296fac8c.jpg"));
    items.add(Product("product 1", "instruction 1 2 3 4", "https://i.pinimg.com/736x/17/22/ad/1722ad8d68d74ab0d9169d684ad026d0.jpg"));
    items.add(Product("Nuggets", "instruction 1 2 3 4 5 6", "https://mir-s3-cdn-cf.behance.net/project_modules/disp/742cd122778635.563183890b983.jpg"));
    items.add(Product("Nuggets", "instruction 1 2 3 4 5 6", "https://newspaperads.ads2publish.com/wp-content/uploads/2021/03/itc-stores-itc-master-chef-frozen-snacks-lajawab-kebab-ad-times-of-india-delhi-27-02-2021.jpg"));
    items.add(Product("product 1", "instruction 1 2 3 4", "https://www.matthews.com.au/upload/images/frozen-food-2.jpg"));

    return items;
  }

  static List<MainListModel> getMainLists(){
    List<MainListModel> mainList = [];

    mainList.add(MainListModel("Last scanned food", getLastScannedItems()));
    mainList.add(MainListModel("Browse brands", getBrowseBrands()));
    mainList.add(MainListModel("Browse categories", getLastScannedItems()));

    return mainList;
  }

  static Future<List<Product>> getProducts() async {
    List<Product> items = [];

    items.add(Product("Frozen Pizza", "instruction 1 2 3 4 5 6", "https://i.pinimg.com/originals/7c/3c/6a/7c3c6ac2530d164c3ecfadf2296fac8c.jpg"));
    items.add(Product("Pizza 2", "instruction 1 2 3 4", "https://i.pinimg.com/736x/17/22/ad/1722ad8d68d74ab0d9169d684ad026d0.jpg"));
    items.add(Product("Nuggets", "instruction 1 2 3 4 5 6", "https://mir-s3-cdn-cf.behance.net/project_modules/disp/742cd122778635.563183890b983.jpg"));
    items.add(Product("Nuggets 2", "instruction 1 2 3 4 5 6", "https://newspaperads.ads2publish.com/wp-content/uploads/2021/03/itc-stores-itc-master-chef-frozen-snacks-lajawab-kebab-ad-times-of-india-delhi-27-02-2021.jpg"));
    items.add(Product("product 1", "instruction 1 2 3 4", "https://www.matthews.com.au/upload/images/frozen-food-2.jpg"));

    return items;
  }

}