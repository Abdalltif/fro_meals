
import 'package:fro_meals/data/models/ui_list.dart';
import 'package:fro_meals/data/remote/network/api_end_points.dart';
import 'package:fro_meals/data/remote/network/base_api.dart';
import 'package:fro_meals/data/remote/network/network_api.dart';
import 'package:fro_meals/domain/repositories/home_repo.dart';

class HomeRepositoryImpl extends HomeRepository {

  final BaseApi _api = NetworkApi();

  @override
  Future<List<UiList>> getMainLists() async {
    List<UiList> lists = [];
    try {
      dynamic response = await _api.getRequest(ApiEndPoints().getMainLists);
      for (var list in response['lists']) {
        UiList uiList = UiList(list['id'], list['name'], list['url']);
        list.add(uiList);
      }
      return lists;
    } catch (e) {
      rethrow;
    }
  }
}