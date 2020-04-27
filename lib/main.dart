import 'package:flutter/material.dart';
import 'package:flutterappredux/repository/auth_repository.dart';
import 'package:flutterappredux/routes/app_routes.dart';
//import 'package:flutterappredux/services/navigation_service.dart';
import 'package:flutterappredux/views/home/index.dart';
import 'package:flutterappredux/views/login/index.dart';
import 'package:get/get.dart';

import 'models/login/auth_model.dart';

void main() {
  //setupLocator();
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
    );
  }
}

class SwitcherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AuthModel>(
      future: AuthRepository.checkAuth(),
      builder: (BuildContext context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          default:
            if (snapshot.hasData) {
              print(snapshot.data);
              if (snapshot.data.success) {
                return HomePage();
                //    locator<NavigationService>().navigateTo('home');
              }
              // else
              // Navigator.of(context).pushNamed('login');

              return LoginPage();
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
        }
      });
  }
}
