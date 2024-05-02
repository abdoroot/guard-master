import 'package:get/get.dart';
import 'package:guard_master/features/splash/presentation/controllers/splash_controller.dart';
import 'package:guard_master/injection.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(sl()));
  }
}
