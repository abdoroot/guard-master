import 'package:get/get.dart';

import 'package:guard_master/features/auth/presentations/controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
