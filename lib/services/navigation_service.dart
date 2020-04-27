import 'package:flutter/material.dart';
//import 'package:get_it/get_it.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushReplacementNamed(routeName);
  }

  getContext() {
    return navigatorKey.currentState.context;
  }
}

/*
GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
*/
