import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fro_meals/data/models/ui_list.dart';
import 'package:fro_meals/data/repositories/home_repo_impl.dart';

class HomeViewModel extends ChangeNotifier {

  final _repository = HomeRepositoryImpl();

  bool isLoading = false;
  bool isIos = Platform.isIOS;

  void _setIsLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  Future<List<UiList>> getMainLists() async {
    _setIsLoading(true);

    List<UiList> lists = await _repository.getMainLists();

    _setIsLoading(false);

    return lists;
  }

}