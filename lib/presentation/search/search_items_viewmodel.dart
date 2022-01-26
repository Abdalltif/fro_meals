import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fro_meals/data/models/item.dart';
import 'package:fro_meals/data/repositories/mock/mock_search_repository_impl.dart';
import 'package:fro_meals/domain/repositories/search_repository.dart';

class SearchItemsViewModel extends ChangeNotifier {

  final SearchRepository _repository = MockSearchRepositoryImpl();

  bool isLoading = false;
  bool isIos = Platform.isIOS;

  void _setIsLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  Future<List<Item>> searchItems(String name) async {
    _setIsLoading(true);

    List<Item> items = await _repository.searchItems(name);
    _setIsLoading(false);

    return items;
  }
}