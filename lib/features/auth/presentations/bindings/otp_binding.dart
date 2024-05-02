import 'package:get/get.dart';
import 'package:guard_master/features/auth/presentations/controllers/otp_controller.dart';

class OTPBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OTPController>(() => OTPController());
  }
}
