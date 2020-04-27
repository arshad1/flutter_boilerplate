import 'package:flutter/cupertino.dart';
import 'package:flutterappredux/views/components/alert_dialog.dart';
import 'package:get/get.dart';

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  int code;
  String message;

  FetchDataException(this.message, this.code)
      : super(message, "Error During Communication: ") {
    String scode = code != null ? code.toString() : '';
    AlertBox.show(
        callback: () {
          Get.back();
        },
        title: 'Error ' + scode,
        message: Text(message));
  }
}

class BadRequestException extends AppException {
  int code;
  String message;

  BadRequestException(this.message, this.code)
      : super(message, "Invalid Request: ") {
    navigator.pushNamed('/'+code.toString());
    String scode = code != null ? code.toString() : '';

    AlertBox.show(
        callback: () {
          Get.back();
        },
        title: 'Error ' + scode,
        message: Text(message));
  }
}

class UnauthorisedException extends AppException {
  int code;
  String message;

  UnauthorisedException(this.message, this.code)
      : super(message, "Unauthorised: ") {
    String scode = code != null ? code.toString() : '';

    AlertBox.show(
        callback: () {
          Get.back();
        },
        title: 'Error ' + scode,
        message: Text(message));
  }
}

class InvalidInputException extends AppException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ") {
    print(message);
  }
}
