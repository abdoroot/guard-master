import 'package:get/get.dart';
import 'package:guard_master/features/home/presentations/controllers/admin/Admins_controller.dart';
import 'package:guard_master/features/home/presentations/controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AdminsController>(() => AdminsController());
  }
}
