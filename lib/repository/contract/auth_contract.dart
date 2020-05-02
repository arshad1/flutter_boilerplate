import 'package:flutterappredux/models/login/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthContract {
  Future<AuthModel> checkAuth();
  Future<AuthModel> Login(String email,String password);

  String getToken(SharedPreferences sharedPreferences) {}

  void setToken(SharedPreferences sharedPreferences, param1) {}
}
