import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/app_constant/app_constants.dart';
import 'package:guard_master/common/routes/pages.dart';
import 'package:guard_master/common/utils/utils.dart';
import 'package:guard_master/generated/l10n.dart';

class OTPController extends GetxController {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;
  bool _loading = false;
  bool get loading => _loading;
  final codeTEXT = TextEditingController();
  String _phone = '';
  String _email = '';

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// come from firebase
  String _verificationId = '';

  /// come from firebase
  int? _forceResendingToken;

  /// timer in seconds
  late Duration timerDuration = Duration(seconds: _maximumTimerSeconds);

  /// the maximum timer in seconds
  final int _maximumTimerSeconds = AppConstants.timeOut;

  /// timer instance
  Timer _timer = Timer(Duration.zero, () {});
  Timer get timer => _timer;

  verificationCode() async {
    if (_globalKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      _loading = true;
      update();
      try {
        final PhoneAuthCredential credential =
            await PhoneAuthProvider.credential(
                verificationId: _verificationId, smsCode: codeTEXT.text);

        if (credential.verificationId != null) {
          await _rest();
        } else
          throw 'Error otp';
      } catch (e) {
        Utils.showError(e.toString());
      }
      _loading = false;
      update();
    }
  }

  _rest() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: _email)
        .then((value) {
      Utils.showSuccess(S.of(Get.context!).passwordRestEmailSent);
      Get.offAllNamed(PagesString.login);
    }).catchError((error) => throw error.message);
  }

  _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (timer.tick >= _maximumTimerSeconds) {
        timer.cancel();
        timerDuration = Duration(seconds: _maximumTimerSeconds);
        update();
      } else {
        timerDuration = Duration(seconds: _maximumTimerSeconds - timer.tick);
        update();
      }
    });
  }

  _sendOTP() async {
    _loading = true;
    update();
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "${_phone}",
        forceResendingToken: _forceResendingToken,
        codeSent: (String verificationId, int? forceResendingToken) async {
          _startTimer();
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
        timeout: Duration(seconds: AppConstants.timeOut),
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
        verificationFailed: (FirebaseAuthException error) {
          log(" Error---> $error");
          _loading = false;
          update();

          if (error.code == 'Invalid-phone-number') {
            Utils.showError(S.of(Get.context!).invalidPhoneNumber);
          } else {
            Utils.showError(error.message ?? S.of(Get.context!).errorSentCode);
          }
        },
      );
    } catch (e) {
      Utils.showError(e.toString());
    }
    _loading = false;
    update();
  }

  @override
  void onInit() async {
    _phone = Get.arguments["phone"];
    _email = Get.arguments["email"];
    print(_phone);
    print(_email);
    await _sendOTP();
    super.onInit();
  }
}
