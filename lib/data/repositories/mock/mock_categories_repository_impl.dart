

import 'package:fro_meals/data/models/category.dart';
import 'package:fro_meals/domain/repositories/categories_repository.dart';

class MockCategoriesRepositoryImpl extends CategoriesRepository {


  @override
  Future<List<Category>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 1300));
    List<Category> cats = [];
    cats.add(Category("Frozen Pizza", "https://i.insider.com/5e7389d7235c183d632b1cd6?width=1136&format=jpeg"));
    cats.add(Category("Vegetables", "https://eatbook.sg/wp-content/uploads/2021/04/ClientNissinby-John-5.jpg"));
    cats.add(Category("Chicken Nuggets", "https://okcredit-blog-images-prod.storage.googleapis.com/2021/05/frozenfood1.jpg"));
    cats.add(Category("Fruits", "https://www.5dollarwhitebox.org/wp-content/uploads/2021/03/Benefits-of-frozen-food.jpg"));
    cats.add(Category("Frozen", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9WXWJthiF_A-6RQhblsYCJw1iHiYFY-nFHw&usqp=CAU"));
    cats.add(Category("Meat", "https://www.canr.msu.edu/contentAsset/image/cbc19b72-bb39-418b-b083-fb781d1fcc22/fileAsset/filter/Resize,Jpeg/resize_w/750/jpeg_q/80"));
    return cats;
  }

}