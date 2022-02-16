
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fro_meals/data/repositories/mock/mock.dart';
import 'package:fro_meals/presentation/home/components/main_lists.dart';
import 'package:fro_meals/presentation/home/home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeViewModel _viewModel = HomeViewModel();
  String url1 = "https://www.ipsos.com/sites/default/files/styles/max_1300x1300/public/ct/publication/2021-04/cover.png";
  String url2 = "https://loudgrowth.in/wp-content/uploads/2020/12/facebook-advertising-agency.jpg";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Card(
                elevation: 2,
                color: Colors.white,
                child: Image.network(url1, fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Card(
                elevation: 2,
                color: Colors.white,
                child: Image.network(url2, fit: BoxFit.cover),
              ),
            ),
          ],
          options: CarouselOptions(
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 500),
              enlargeCenterPage: false,
              height: 200,
          ),
        ),
        const Opacity(
          opacity: 0.3,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(
              height: 2,
              thickness: 0.5,
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: MockData.getMainLists().length,
              itemBuilder: (context,index){
                return MainLists(title: MockData.getMainLists()[index].title, products: MockData.getMainLists()[index].items,);
              }
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
