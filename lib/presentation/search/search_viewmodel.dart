import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fro_meals/data/models/product.dart';
import 'package:fro_meals/data/repositories/mock/mock_search_repository_impl.dart';
import 'package:fro_meals/domain/repositories/search_repository.dart';

class SearchViewModel extends ChangeNotifier {

  final SearchRepository _repository = MockSearchRepositoryImpl();

  bool isLoading = false;
  bool isIos = Platform.isIOS;

  void _setIsLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  Future<List<Product>> searchItems(String name) async {
    _setIsLoading(true);

    List<Product> items = await _repository.searchItems(name);
    _setIsLoading(false);

    return items;
  }
}