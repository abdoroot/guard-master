import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/services/firebase_ref.dart';

class ChangePasswordController extends GetxController {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;

  bool _loading = false;
  bool get loading => _loading;

  TextEditingController oldPasswordTEXT = TextEditingController();
  TextEditingController newPasswordTEXT = TextEditingController();
  TextEditingController confirmNewPasswordTEXT = TextEditingController();

  changePassword() async {
    if (_globalKey.currentState!.validate()) {
      User user = await FirebaseAuth.instance.currentUser!;

      _loading = true;
      update();
      final cred = await EmailAuthProvider.credential(
          email: user.email!, password: oldPasswordTEXT.text);
      await user.reauthenticateWithCredential(cred).then((value) async {
        await user.updatePassword(newPasswordTEXT.text).then((_) {
          FirebaseCollection.technicalFR
              .doc(user.uid)
              .update({"password": newPasswordTEXT.text});
        }).catchError((error) {
          print(error);
        });
      }).catchError((err) {
        print(err);
      });
      _loading = false;
    }
  }

  Future<bool> _changePassword(
      String currentPassword, String newPassword) async {
    bool success = false;

    //Create an instance of the current user.
    //Must re-authenticate user before updating the password. Otherwise it may fail or user get signed out.

    return success;
  }
}
