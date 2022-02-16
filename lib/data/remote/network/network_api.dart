import 'dart:convert';
import 'dart:io';
import 'package:fro_meals/data/remote/app_exception.dart';
import 'package:fro_meals/data/remote/network/base_api.dart';
import 'package:http/http.dart' as http;

class NetworkApi extends BaseApi {

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjQxOTkxMTA1LCJleHAiOjE2NDQ1ODMxMDV9.Ca0QpnL8LWLMHLh86K9AP36MAL38gRi_F5p2HRqsMHI',
  };

  @override
  Future<dynamic> getRequest(String params) async {
    var url = Uri.parse(baseUrl + params);
    dynamic responseJson;
    try {
      final response = await http.get(url, headers: requestHeaders);
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
      final response = await http.post(url, headers: requestHeaders, body: body);
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