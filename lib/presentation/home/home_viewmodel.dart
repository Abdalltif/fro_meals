import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fro_meals/data/models/ui_list.dart';
import 'package:fro_meals/data/repositories/home_repo_impl.dart';

class HomeViewModel extends ChangeNotifier {

  final _homeRepo = HomeRepoImpl();

  bool isLoading = false;
  bool isIos = Platform.isIOS;

  void _setIsLoading(bool val) {
    print("Loading? :: $val");
    isLoading = val;
    notifyListeners();
  }


  Future<List<UiList>> getMainLists() async {
    _setIsLoading(true);

    dynamic jsonData = await _homeRepo.getMainLists();

    List<UiList> list = [];

    if(jsonData['status'] == 'success') {

      for (var ad in jsonData['lists']) {
        UiList uiList = UiList(ad['id'], ad['name'], ad['url']);
        list.add(uiList);
      }
      _setIsLoading(false);
    } else {
      _setIsLoading(false);
    }

    return list;
  }

}