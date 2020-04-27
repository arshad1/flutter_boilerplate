import 'package:get/get.dart';

class RouteMiddleWare {
  static observer(Routing routing) {
    /// You can listen in addition to the routes, the snackbars, dialogs and bottomsheets on each screen.
    ///If you need to enter any of these 3 events directly here,
    ///you must specify that the event is != Than you are trying to do.
    if (routing.current == '/404' && !routing.isSnackbar) {
      Get.snackbar("Hi", "Middleware 404 page");
    } else if (routing.current =='/login'){
      print('middleware login screen');
    }
  }
}
