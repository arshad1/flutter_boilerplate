import 'dart:convert';

import 'package:flutterappredux/models/login/auth_model.dart';
import 'package:flutterappredux/services/api-service.dart';
import 'package:flutterappredux/services/http_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  static HttpHelper _http = HttpHelper();

  static Future<AuthModel> checkAuth() async {
    var response = await _http.get(Api.home, auth: true);

    AuthModel _authData = AuthModel.fromJson(jsonDecode(response));
    print('_authData');

    return _authData;
  }

  static String getToken(SharedPreferences sharedPreferences) {}

  static void setToken(SharedPreferences sharedPreferences, param1) {}
}
