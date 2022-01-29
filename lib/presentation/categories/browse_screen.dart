import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fro_meals/common/helpers.dart';
import 'package:fro_meals/data/models/brand.dart';
import 'package:fro_meals/data/models/category.dart';
import 'package:fro_meals/presentation/categories/browse_viewmodel.dart';
import 'package:fro_meals/presentation/categories/components/brand_grid_item.dart';
import 'package:fro_meals/presentation/categories/components/category_grid_item.dart';
import 'package:provider/provider.dart';


class BrowseScreen extends StatefulWidget {
  const BrowseScreen({Key? key}) : super(key: key);

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> with SingleTickerProviderStateMixin{
  final BrowseViewModel _viewModel = BrowseViewModel();
  late List<Category> categories = [];
  late List<Brand> brands = [];
  late final TabController _tabController = TabController(vsync: this, length: 2);

  @override
  void initState() {
    _getCategories();
    _getBrands();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Colors.blue[400],
          unselectedLabelColor: Colors.grey[400],
          indicator: const UnderlineTabIndicator(
            insets: EdgeInsets.symmetric(horizontal: 14),
            borderSide: BorderSide(
              width: 0.3,
              color: Colors.blue,
            ),
          ),
          tabs: const [
            Tab(text: "Categories",),
            Tab(text: "Brands",),
          ],
        ),
        ChangeNotifierProvider<BrowseViewModel>(
          create: (BuildContext context) => _viewModel,
          child: Consumer<BrowseViewModel>(builder: (context, viewModel, _) {

            if (viewModel.isLoading) {
              return const Padding(
                padding: EdgeInsets.all(28.0),
                child: CircularProgressIndicator(color: Colors.blue,),
              );
            }

            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                controller: _tabController,
                children: [
                  categoriesTab(),
                  brandTab(),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }

  _getCategories() async {
    categories = await _viewModel.getCategories();
  }

  _getBrands() async {
    brands = await _viewModel.getBrands();
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

  Widget categoriesTab() {
    return Container(
      padding: EdgeInsets.all(0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Column(
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
            )
          ],
        ),
      ),
    );
  }

  Widget brandsGrid() {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      itemCount: brands.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(22.0),
              child: BrandGridItem(brands[index])
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

  Widget brandTab() {
    return Container(
      padding: const EdgeInsets.all(0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                  "Top brands",
                  style: TextStyle(color: Colors.black, fontSize: 18)
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: brandsGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
