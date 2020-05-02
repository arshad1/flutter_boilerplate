import 'dart:convert';

import 'package:flutterappredux/models/login/auth_model.dart';
import 'package:flutterappredux/repository/contract/auth_contract.dart';
import 'package:flutterappredux/services/api-service.dart';
import 'package:flutterappredux/services/http_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository extends AuthContract {
  static HttpHelper _http = HttpHelper();

  Future<AuthModel> checkAuth() async {

    var response = await _http.get(Api.home, auth: true);

    AuthModel _authData = AuthModel.fromJson(jsonDecode(response));

    return _authData;
  }

  Future<AuthModel> Login(email,password) async {

    var response = await _http.post(Api.login, {email:email, password:password});

    AuthModel _authData = AuthModel.fromJson(jsonDecode(response));

    return _authData;
  }
}
