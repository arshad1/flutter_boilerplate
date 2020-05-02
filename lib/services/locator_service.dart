import 'package:flutterappredux/repository/contract/auth_contract.dart';
import 'package:flutterappredux/repository/faker/fake_auth_repository.dart';
import 'package:flutterappredux/repository/http/auth_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

const bool USE_FAKE_IMPLEMENTATION = true;

void setupLocator() {
  locator.registerSingleton<AuthContract>(
      USE_FAKE_IMPLEMENTATION ? FakeAuthRepository() : AuthRepository());
}
