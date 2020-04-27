import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterappredux/views/errors/404_error.dart';
import 'package:flutterappredux/views/home/index.dart';
import 'package:flutterappredux/views/login/index.dart';
import 'package:get/get.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return GetRoute(
          page: HomePage(),
          settings: settings,
        );
      case '/home':
        return GetRoute(
            settings: settings, page: HomePage(), transition: Transition.fade);
      case '/login':
        return GetRoute(
            settings: settings,
            page: LoginPage(),
            popGesture: true,
            transition: Transition.cupertino);
      case '/404':
        return GetRoute(
            settings: settings,
            page: Error404(),
            popGesture: true,
            transition: Transition.cupertino);
      default:
        return GetRoute(
            settings: settings,
            transition: Transition.fade,
            page: Scaffold(
              body:
                  Center(child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}
