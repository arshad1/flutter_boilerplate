import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: SafeArea(
            child: Container(
          child: Text('Login page'),
        )),
      ), onWillPop: () {
        return ;
    },
    );
  }
}
