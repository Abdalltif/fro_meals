import 'package:flutter/material.dart';
import 'package:fro_meals/data/models/item.dart';
import 'package:fro_meals/data/models/main_list_model.dart';
import 'package:fro_meals/presentation/home/components/main_lists.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String url = "https://images.creativemarket.com/0.1.0/ps/8743179/1160/772/m1/fpnw/wm0/healthy-food-facebook-ad-.png?1595142715&s=32c95bd7882f9f3751293714ec3948af";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Card(
            elevation: 0,
            child: Image.network(url, fit: BoxFit.cover),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _getMainLists().length,
              itemBuilder: (context,index){
                return MainLists(title: _getMainLists()[index].title, items: _getMainLists()[index].items,);
              }
          ),
        )
      ],
    );
  }

  List<Item> _getLastScannedItems(){
    List<Item> items = [];

    items.add(Item("product 1", "instruction 1 2 3 4", "url"));
    items.add(Item("product 2", "instruction 1 2 3 4 5 6", "url"));
    items.add(Item("product 1", "instruction 1 2 3 4", "url"));

    return items;
  }

  List<MainListModel> _getMainLists(){
    List<MainListModel> mainList = [];

    mainList.add(MainListModel("Last scanned food", _getLastScannedItems()));
    mainList.add(MainListModel("Browse brands", _getLastScannedItems()));
    mainList.add(MainListModel("Last scanned food", _getLastScannedItems()));
    mainList.add(MainListModel("Last scanned food", _getLastScannedItems()));

    return mainList;
  }
}
