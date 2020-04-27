import 'package:flutter/material.dart';
import 'package:flutterappredux/services/navigation_service.dart';
import 'package:get/get.dart';

class AlertBox {
  static show({@required Widget message, Function callback, String title}) {
    Get.defaultDialog(
        title: title != null ? title : "Alert",
        content: message,
        cancel: FlatButton(
          child: Text("Ok"),
          onPressed: () => callback(),
        ));
  }
}
