import 'package:flutter/material.dart';
import 'package:flutterappredux/controllers/base_controller.dart';
import 'package:flutterappredux/models/login/auth_model.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  static void afterLoginResponseReceived(AuthModel response) {
    if (response.success) {
      // set shared preference
      navigator.pushNamed('/home');
    } else {
     // Get.offNamedUntil('/login', ModalRoute.withName('/'));
      Get.snackbar('Error', response.error.message,
          backgroundColor: Colors.white);
    }
  }
}
