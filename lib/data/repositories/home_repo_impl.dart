
import 'package:fro_meals/data/remote/network/api_end_points.dart';
import 'package:fro_meals/data/remote/network/base_api.dart';
import 'package:fro_meals/data/remote/network/network_api.dart';
import 'package:fro_meals/domain/repositories/home_repo.dart';

class HomeRepoImpl extends HomeRepo {

  final BaseApi _api = NetworkApi();

  @override
  Future<dynamic> getMainLists() async {
    try {
      dynamic response = await _api.getRequest(ApiEndPoints().getMainLists);
      return response;
    } catch (e) {
      rethrow;
    }
  }

}