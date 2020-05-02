import 'dart:convert';
import 'dart:io';
import 'package:flutterappredux/config/app_config.dart';
import 'package:flutterappredux/exceptions/app_exception.dart';
import 'package:flutterappredux/repository/contract/auth_contract.dart';
import 'package:flutterappredux/services/locator_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class HttpHelper {
  final String _baseUrl = AppConfig.baseUrl;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences _sharedPreferences;

  Future<dynamic> get(String url, {bool auth = false}) async {
    print(url);
    Map<String, String> hd = await getHeaders(auth);
    print(hd.toString());
    var responseJson;
    try {
      final response = await http.get(url, headers: hd);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', null);
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body, {bool auth = false}) async {
    Map<String, String> hd = await getHeaders(auth);

    print('Api Post, url $url');
    var responseJson;
    try {
      final response = await http.post(url, body: body, headers: hd);
      responseJson = _returnResponse(response);
      print(responseJson);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection', null);
    }
    print('api post.');
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body, {bool auth = false}) async {
    Map<String, String> hd = await getHeaders(auth);

    print('Api Put, url $url');
    var responseJson;
    try {
      final response = await http.put(url, body: body, headers: hd);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection', null);
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String url, {bool auth = false}) async {
    Map<String, String> hd = await getHeaders(auth);
    var apiResponse;
    try {
      final response = await http.delete(url, headers: hd);
      apiResponse = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', null);
    }
    return apiResponse;
  }

  getHeaders(auth) async {
    Map<String, String> headers = {
      HttpHeaders.acceptHeader: "application/json"
    };

    if (auth) {
      _sharedPreferences = await _prefs;
      String authToken = locator<AuthContract>().getToken(_sharedPreferences);
      if (authToken != null || authToken == '') {
        headers
            .addAll({HttpHeaders.authorizationHeader: "Bearer " + authToken});
      }
    }

    return headers;
  }

  dynamic _returnResponse(http.Response response) async {
    var responseBody = jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = response.body;
        return responseJson;
      case 400:
        var responseJson = response.body;
        return responseJson;
      case 404:
        var message = responseBody['error'] != null &&
                responseBody['error']['message'] != null
            ? responseBody['error']['message']
            : '404 error from server';
        throw BadRequestException(message.toString(), response.statusCode);
      //var responseJson = response.body;
      //return responseJson;
      case 401:
      case 403:
        var message = responseBody['error'] != null &&
                responseBody['error']['message'] != null
            ? responseBody['error']['message']
            : response.statusCode.toString() + ' error from server';

        throw UnauthorisedException(message, response.statusCode);

        /*  var responseJson = jsonDecode(response.body);
        if (response.statusCode == 401 &&
            responseJson['error']['code'] == 'mobile_verification_pending') {
          // locator<NavigationService>().navigateTo('mobileVerificationMobileScreen');
          return response.body;
        } else {
          _sharedPreferences = await _prefs;
          AuthRepository.setToken(_sharedPreferences, null);
          // locator<NavigationService>().navigateTo('login');
          return response.body;
        }*/
        break;
      case 422:
        var responseJson = response.body.toString();
        return responseJson;
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
            response.statusCode);
    }
  }
}
