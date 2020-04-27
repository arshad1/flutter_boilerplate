import 'package:flutter/material.dart';
import 'package:flutterappredux/views/layout/base_widget.dart';

class Error404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      context: context,
      child: Center(
        child: Container(
          child: Text('404 error from server'),
        ),
      ),
    );
  }
}
