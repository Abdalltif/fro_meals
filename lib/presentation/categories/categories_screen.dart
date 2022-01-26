import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fro_meals/common/helpers.dart';
import 'package:fro_meals/data/models/category.dart';
import 'package:fro_meals/presentation/categories/categories_viewmodel.dart';
import 'package:fro_meals/presentation/categories/components/category_grid_item.dart';
import 'package:fro_meals/presentation/search/search_screen.dart';
import 'package:provider/provider.dart';


class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoriesViewModel _viewModel = CategoriesViewModel();
  late List<Category> categories = [];

  @override
  void initState() {
    _getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            ChangeNotifierProvider<CategoriesViewModel>(
              create: (BuildContext context) => _viewModel,
              child: Consumer<CategoriesViewModel>(builder: (context, viewModel, _) {

                if (viewModel.isLoading) {
                  return const Center(child: CircularProgressIndicator(color: Colors.blue,));
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        "Top categories",
                        style: TextStyle(color: Colors.black, fontSize: 18)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: categoriesGrid(),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  _getCategories() async {
    categories = await _viewModel.getCategories();
  }

  Widget categoriesGrid() {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(22.0),
              child: CategoryGridItem(categories[index])
          ),
          onTap: (){
            Helpers.playClickSound();
            // goToCategoryPlacesScreen(context, categories.data[index]);
          },
        );
      },
      staggeredTileBuilder: (int index) =>
      StaggeredTile.count(2, index.isEven ? 2 : 1.5),
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      scrollDirection: Axis.vertical,
    );
  }
}
