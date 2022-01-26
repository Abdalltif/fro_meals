import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fro_meals/data/models/category.dart';
import 'package:fro_meals/data/models/item.dart';
import 'package:fro_meals/data/repositories/mock/mock_categories_repository_impl.dart';
import 'package:fro_meals/domain/repositories/categories_repository.dart';

class CategoriesViewModel extends ChangeNotifier {

  final CategoriesRepository _repository = MockCategoriesRepositoryImpl();

  bool isLoading = false;
  bool isIos = Platform.isIOS;

  void _setIsLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  Future<List<Category>> getCategories() async {
    _setIsLoading(true);

    List<Category> categories = await _repository.getCategories();
    _setIsLoading(false);

    return categories;
  }
}