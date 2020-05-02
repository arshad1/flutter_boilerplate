// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

 import 'package:flutter_test/flutter_test.dart';

import 'package:flutterappredux/repository/contract/auth_contract.dart';
import 'package:flutterappredux/services/locator_service.dart';

void main() {
  setUpAll((){
    setupLocator();
  });
  test('test checkAuth method', () async {
    var authservice = locator<AuthContract>();
    var data = await authservice.checkAuth();
    expect(data.status == 200, true);
  });
}
