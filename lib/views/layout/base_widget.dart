import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseWidget extends StatelessWidget {
  BuildContext context;
  Widget child;
  AppBar appBar;

  BaseWidget({this.child, this.context, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar != null
          ? AppBar(
              title: Text(''),
            )
          : null,
      body: child,

    );
    ;
  }
}
