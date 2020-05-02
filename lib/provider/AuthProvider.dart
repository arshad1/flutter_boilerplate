import 'package:flutter/material.dart';
import 'package:flutterappredux/models/login/auth_model.dart';
import 'package:flutterappredux/repository/contract/auth_contract.dart';
import 'package:flutterappredux/services/locator_service.dart';

class AuthProvider extends ChangeNotifier {
  String _emailTxt;
  String _passwordTxt;
  String _emailErrorTxt;
  String _passwordErrorTxt;
  bool _isLoading = false;
  var loginResponse;

  bool get isLoading => _isLoading;

  bool validateForm(email, pass) {
    _emailTxt=email;
    _passwordTxt=pass;
    if (email == null || email.length == 0) {
      _emailErrorTxt = 'Email is required';
    } else
      _emailErrorTxt = null;

    if (pass == null || pass.length == 0) {
      _passwordErrorTxt = 'Password is required';
    } else
      _passwordErrorTxt = null;

    notifyListeners();
    return _passwordErrorTxt == null && _emailErrorTxt == null;
  }

  Future<AuthModel> requestLoginToServer() async {
    _isLoading = true;
    notifyListeners();
    loginResponse =
        await locator<AuthContract>().Login(_emailTxt, _passwordTxt);
    _isLoading = false;
    notifyListeners();
    return loginResponse;
  }

  String get passwordErrorTxt => _passwordErrorTxt;

  String get emailErrorTxt => _emailErrorTxt;
}
