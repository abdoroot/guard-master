import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/routes/pages.dart';
import 'package:guard_master/common/services/firebase_ref.dart';
import 'package:guard_master/common/utils/utils.dart';
import 'package:guard_master/generated/l10n.dart';

class ForgetPasswordController extends GetxController {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;
  bool _loading = false;
  bool get loading => _loading;
  final emailTEXT = TextEditingController();
  final phoneTEXT = TextEditingController();

  continueToChangePassword() async {
    if (_globalKey.currentState!.validate()) {
      _loading = true;
      update();
      bool userExists = await checkIfUserExists(emailTEXT.text.toLowerCase());
      if (userExists) {
        rest().then((value) {
          Utils.showSuccess(S.of(Get.context!).passwordRestEmailSent);
          Get.offAllNamed(PagesString.login);
        }).catchError((e) {
          Utils.showSuccess(S.of(Get.context!).errorError(e));
        });
      } else {
        bool adminExists =
            await checkIfAdminExists(emailTEXT.text.toLowerCase());
        if (adminExists) {
          rest().then((value) {
            Utils.showSuccess(S.of(Get.context!).passwordRestEmailSent);
            Get.offAllNamed(PagesString.login);
          }).catchError((e) {
            Utils.showSuccess(S.of(Get.context!).errorError(e));
          });
        } else {
          Utils.showError(S.of(Get.context!).makeSureYourEmail);
        }
      }
      _loading = false;
      update();
    }
  }

  Future<String> rest() async {
    return await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailTEXT.text.toLowerCase())
        .then((value) => 'done')
        .catchError((error) => throw error);
  }

  Future<bool> checkIfUserExists(String email) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseCollection.technicalFR
              .where('email', isEqualTo: email.toLowerCase())
              .get();

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      Utils.showError(S.of(Get.context!).noMatchingDocumentFound);
      return false;
    }
  }

  Future<bool> checkIfAdminExists(String email) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseCollection.adminsFR
              .where('email', isEqualTo: email.toLowerCase())
              .get();

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      Utils.showError(S.of(Get.context!).noMatchingDocumentFound);
      return false;
    }
  }
}
