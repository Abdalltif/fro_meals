
abstract class BaseApi {

  final String baseUrl = 'https://dashboard.fromeal.com/';

  Future<dynamic> getRequest(String url);

  Future<dynamic> postRequest(String url, Map<String, dynamic> body);

}