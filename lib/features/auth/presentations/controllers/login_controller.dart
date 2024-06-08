import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/helper/cach.dart';
import 'package:guard_master/common/routes/pages.dart';
import 'package:guard_master/common/services/notification_service.dart';
import 'package:guard_master/common/services/firebase_ref.dart';
import 'package:guard_master/common/utils/utils.dart';
import 'package:guard_master/features/home/data/models/user_model.dart';
import 'package:guard_master/generated/l10n.dart';

class LoginController extends GetxController {
  NotificationServiceImpl _notificationFirebaseImpl = NotificationServiceImpl();
  final _firebase = FirebaseAuth.instance;

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;
  final emailTEXT = TextEditingController();
  final passwordTEXT = TextEditingController();
  bool _loading = false;
  bool get loading => _loading;

  login() async {
    if (_globalKey.currentState!.validate()) {
      TextInput.finishAutofillContext();
      _loading = true;
      update();
      bool userExists = await checkIfUserExists(emailTEXT.text.toLowerCase());
      if (userExists) {
        await _signing().then((value) async {
          if (value?.uid != null) {
            await CacheHelper.saveData(
                key: KeyStorage.accountType, value: KeyStorage.typeTechnical);
            final UserModel? user =
                await updateData(KeyStorage.typeTechnical, value!.uid);
            await CacheHelper.saveSecure(
                key: KeyStorage.user, value: user?.toJson());
            Utils.showSuccess(
                S.of(Get.context!).welcomeBack(KeyStorage.typeTechnical));
            Get.offAllNamed(PagesString.home);
          }
        }).catchError((e) => Utils.showError(e.message));
      } else {
        bool adminExists =
            await checkIfAdminExists(emailTEXT.text.toLowerCase());
        if (adminExists) {
          await _signing().then((value) async {
            if (value?.uid != null) {
              await CacheHelper.saveData(
                  key: KeyStorage.accountType, value: KeyStorage.typeAdmin);
              final UserModel? user =
                  await updateData(KeyStorage.typeAdmin, value!.uid);
              await CacheHelper.saveSecure(
                  key: KeyStorage.user, value: user?.toJson());
              Utils.showSuccess(
                  S.of(Get.context!).welcomeBack(KeyStorage.typeTechnical));
              Get.offAllNamed(PagesString.home);
            }
          }).catchError((e) => Utils.showError(e.message));
        } else {
          Utils.showError(S.of(Get.context!).makeSureYourEmail);
        }
      }
      _loading = false;
      update();
    }
  }

  Future<User?> _signing() async {
    return await _firebase
        .signInWithEmailAndPassword(
            email: emailTEXT.text.toLowerCase().trim(),
            password: passwordTEXT.text.trim())
        .then((value) async => value.user)
        .catchError((e) async {
      if (e.code == 'user-not-found')
        return await _register().then((user) async {
          return user;
        }).catchError((e) => throw e);
      else
        throw e;
    });
  }

  Future<User?> _register() async {
    return await _firebase
        .createUserWithEmailAndPassword(
            email: emailTEXT.text.toLowerCase().trim(),
            password: passwordTEXT.text.trim())
        .then((value) => value.user)
        .catchError((e) => throw e);
  }

  Future<bool> checkIfUserExists(String email) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseCollection.technicalFR
              .where('email', isEqualTo: email)
              .get();

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkIfAdminExists(String email) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseCollection.adminsFR
              .where('email', isEqualTo: email)
              .get();

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  Future<UserModel?>? updateData(String accountType, String uid) async {
    UserModel? user;
    await Future.delayed(Duration(seconds: 1));
    final String? fcm = await _notificationFirebaseImpl.getFCMToken();

    if (fcm != null) {
      final CollectionReference<Map<String, dynamic>> querySnapshot =
          accountType == KeyStorage.typeTechnical
              ? FirebaseCollection.technicalFR
              : FirebaseCollection.adminsFR;
      await querySnapshot
          .where('email', isEqualTo: emailTEXT.text.toLowerCase())
          .get()
          .then((value) {
        value.docs.forEach(
          (QueryDocumentSnapshot<Map<String, dynamic>> e) {
            Map<String, dynamic> data = e.data();
            data.addAll({
              "fcm": fcm,
              "uid": uid,
              "password": passwordTEXT.text,
            });
            user = UserModel.fromMap(data);
          },
        );

        // Assuming there's only one document with a matching email
        DocumentReference userDoc = value.docs.first.reference;
        // Update the document
        userDoc.update(user!.toMap()).then((_) {
          log(S.of(Get.context!).requestUpdatedSuccessfully);
        }).catchError((error) {
          log("error: $error");
          _loading = false;
          update();
          log(S.of(Get.context!).errorUpdatingRequestError(error));
        });
      }).catchError((e) {
        log("e: $e");
        _loading = false;
        update();
      });
      return user;
    }
    return null;
  }

  forgetPassword() {
    Get.offAllNamed(PagesString.forgetPassword);
  }
}
