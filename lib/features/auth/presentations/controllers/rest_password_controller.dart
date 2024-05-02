import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/routes/pages.dart';
import 'package:guard_master/common/utils/utils.dart';
import 'package:guard_master/generated/l10n.dart';

class RestPasswordController extends GetxController {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;

  bool _loading = false;
  bool get loading => _loading;

  String _email = '';
  TextEditingController confirmNewPasswordTEXT = TextEditingController();
  TextEditingController newPasswordTEXT = TextEditingController();

  rest() async {
    if (_globalKey.currentState!.validate()) {
      _loading = true;
      update();
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _email).then(
          (value) {
        Utils.showSuccess(S.of(Get.context!).passwordRestEmailSent);
        Get.offAllNamed(PagesString.login);
      }).catchError(
          (error) => Utils.showSuccess(S.of(Get.context!).errorError(error)));
      _loading = false;
      update();
    }
  }

  @override
  void onInit() {
    _email = Get.arguments['email'];
    print(_email);
    super.onInit();
  }
}
