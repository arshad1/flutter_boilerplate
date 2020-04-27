import 'package:flutterappredux/config/app_config.dart';

class Api {
  static const login = AppConfig.baseUrl + 'customer/login';
  static const register = AppConfig.baseUrl + 'customer/register';
  static const String home = AppConfig.baseUrl + 'home?device=android';
}
