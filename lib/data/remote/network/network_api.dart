import 'dart:convert';
import 'dart:io';
import 'package:fro_meals/data/remote/app_exception.dart';
import 'package:fro_meals/data/remote/network/base_api.dart';
import 'package:http/http.dart' as http;

class NetworkApi extends BaseApi {

  @override
  Future<dynamic> getRequest(String params) async {
    var url = Uri.parse(baseUrl + params);
    dynamic responseJson;
    try {
      final response = await http.get(url);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postRequest(String params, Map<String, dynamic> body) async {
    var url = Uri.parse(baseUrl + params);
    dynamic responseJson;
    try {
      final response = await http.post(url, body: body);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}