import 'package:flutter/material.dart';
import 'package:flutterappredux/middleware/route_middleware.dart';
import 'package:flutterappredux/provider/AuthProvider.dart';
import 'package:flutterappredux/repository/contract/auth_contract.dart';
import 'package:flutterappredux/routes/app_routes.dart';
import 'package:flutterappredux/services/locator_service.dart';
import 'package:flutterappredux/views/home/index.dart';
import 'package:flutterappredux/views/login/index.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'models/login/auth_model.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      navigatorKey: Get.key,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SwitcherPage(),
      onGenerateRoute: Router.generateRoute,
      navigatorObservers: [
        GetObserver(RouteMiddleWare.observer),
      ],
    );
  }
}

class SwitcherPage extends StatelessWidget {
  var _authRepository = locator<AuthContract>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AuthModel>(
        future: _authRepository.checkAuth(),
        builder: (BuildContext context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasData) {
                if (snapshot.data.success) {
                  return HomePage();
                  //    locator<NavigationService>().navigateTo('home');
                }
                // else
                // Navigator.of(context).pushNamed('login');

                return ChangeNotifierProvider(create: (BuildContext context) => AuthProvider(),child: LoginPage());
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
          }
        });
  }
}
