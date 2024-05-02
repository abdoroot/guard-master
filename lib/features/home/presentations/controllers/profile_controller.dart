import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/helper/cach.dart';
import 'package:guard_master/common/services/firebase_ref.dart';
import 'package:guard_master/common/utils/utils.dart';
import 'package:guard_master/features/home/data/models/user_model.dart';
import 'package:guard_master/generated/l10n.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  GlobalKey<FormState> globalKey = GlobalKey();
  TextEditingController nameTEXT = TextEditingController();
  TextEditingController emailTEXT = TextEditingController();
  TextEditingController mobileNumberTEXT = TextEditingController();
  TextEditingController companyNameTEXT = TextEditingController();

  bool _loading = false;
  bool get loading => _loading;

  UserModel? _user;
  UserModel? get user => _user;

  _getUserDate() async {
    _loading = true;
    update();
    _user = await UserModel.fromJson(
        await CacheHelper.getSecure(key: KeyStorage.user));
    _loading = false;
    update();
  }

  updateInformation() async {
    if (globalKey.currentState!.validate()) {
      FocusScope.of(Get.context!).unfocus();
      _loading = true;
      update();
      await updateData();
    }
  }

  Future<UserModel?>? updateData() async {
    final CollectionReference<Map<String, dynamic>> querySnapshot =
        _user?.accountType == KeyStorage.typeTechnical
            ? FirebaseCollection.technicalFR
            : FirebaseCollection.adminsFR;
    await querySnapshot
        .where('email', isEqualTo: emailTEXT.text)
        .get()
        .then((value) {
      // Assuming there's only one document with a matching email
      DocumentReference userDoc = value.docs.first.reference;
      UserModel userData = UserModel(
          name: nameTEXT.text,
          phone: mobileNumberTEXT.text,
          companyName: companyNameTEXT.text);
      // Update the document
      userDoc.update(userData.toMap()).then((_) async {
        await CacheHelper.saveSecure(
            key: KeyStorage.user, value: userData.toJson());
        _getUserDate();
        Utils.showSuccess(S.of(Get.context!).updatedSuccessfully);
      }).catchError((error) {
        log("error: $error");
        _loading = false;
        update();
        Utils.showError(S.of(Get.context!).errorUpdatingRequestError(error));
      });
    }).catchError((e) {
      log("e: $e");
      _loading = false;
      update();
    });
    return null;
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onInit() async {
    await _getUserDate();
    nameTEXT.text = _user?.name ?? "";
    emailTEXT.text = _user?.email ?? "";
    mobileNumberTEXT.text = _user?.phone ?? "";
    companyNameTEXT.text = _user?.companyName ?? "";
    super.onInit();
  }
}
