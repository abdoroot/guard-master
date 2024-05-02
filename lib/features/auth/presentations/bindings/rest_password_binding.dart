import 'package:get/get.dart';
import 'package:guard_master/features/auth/presentations/controllers/rest_password_controller.dart';

class RestPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestPasswordController>(() => RestPasswordController());
  }
}
