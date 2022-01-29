import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fro_meals/data/models/brand.dart';
import 'package:fro_meals/data/models/category.dart';
import 'package:fro_meals/data/repositories/mock/mock_categories_repository_impl.dart';
import 'package:fro_meals/domain/repositories/browse_repository.dart';

class BrowseViewModel extends ChangeNotifier {

  final BrowseRepository _repository = MockBrowseRepositoryImpl();
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

  Future<List<Brand>> getBrands() async {
    _setIsLoading(true);

    List<Brand> brands = await _repository.getBrands();
    _setIsLoading(false);

    return brands;
  }

}