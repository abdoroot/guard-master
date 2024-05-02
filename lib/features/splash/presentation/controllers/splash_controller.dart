import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/routes/pages.dart';
import 'package:guard_master/common/services/network_service.dart';
import 'package:guard_master/common/utils/utils.dart';
import 'package:guard_master/generated/assets/assets.dart';
import 'package:guard_master/generated/l10n.dart';

class SplashController extends GetxController {
  final NetworkInfo _networkInfo;
  SplashController(this._networkInfo);
  nav() {
    Future.delayed(
      Duration(seconds: 4),
      () => FirebaseAuth.instance.currentUser != null
          ? Get.offAllNamed(PagesString.home)
          : Get.offAllNamed(PagesString.login),
    );
  }

  _listenToNetWork() {
    _networkInfo.listenToNetworkStream.onData((bool isConnect) {
      if (isConnect) {
        if (Get.isDialogOpen!) {
          Get.back();
        }
      } else {
        Utils.showLottieDialog(
            lottie: Assets.assetsImagesAnimationsNoConnectionToInternet,
            text: S.of(Get.context!).noInternetConnection);
      }
    });
  }

  @override
  void onReady() {
    _listenToNetWork();
    super.onReady();
  }

  @override
  void onInit() async {
    _networkInfo.initializeNetworkStream();
    // createLicAndOTP();
    nav();
    super.onInit();
  }

  @override
  void dispose() {
    _networkInfo.dispose();
    super.dispose();
  }
}
