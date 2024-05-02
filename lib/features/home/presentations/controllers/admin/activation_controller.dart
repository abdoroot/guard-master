import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/app_constant/app_constants.dart';
import 'package:guard_master/common/helper/cach.dart';
import 'package:guard_master/common/helper/date_time.dart';
import 'package:guard_master/common/services/firebase_ref.dart';
import 'package:guard_master/common/services/notification_service.dart';
import 'package:guard_master/common/utils/utils.dart';
import 'package:guard_master/features/home/data/models/user_model.dart';
import 'package:guard_master/features/splash/data/models/codes_lic_model.dart';
import 'package:guard_master/generated/l10n.dart';

class ActivationController extends GetxController {
  static ActivationController get to => Get.find();

  GlobalKey<FormState> globalKey = GlobalKey();

  TextEditingController nameTEXT = TextEditingController();
  TextEditingController phoneTEXT = TextEditingController();
  TextEditingController emailTEXT = TextEditingController();
  TextEditingController pcSerialNo = TextEditingController();
  TextEditingController companyNameTEXT = TextEditingController();
  TextEditingController companyLicNoTEXT = TextEditingController();

  String selectedCountry = AppConstants.country;
  bool _loading = false;
  bool get loading => _loading;
  String _pcStatus = '';
  String get pcStatus => _pcStatus;

  changePCStatus(String status) {
    _pcStatus = status;
    update();
  }

  editTechnical() async {
    if (globalKey.currentState!.validate()) {
      _loading = true;
      update();

      String activationCode = '';
      final code = await FirebaseCollection.codes
          .where('pcSerialNo', isEqualTo: _user?.pcSerialNo)
          .get();

      if (code.docs.isNotEmpty) {
        final CodesLicModel codes =
            CodesLicModel.fromMap(await code.docs.first.data());
        activationCode = codes.activationCode ?? "";
      } else {
        final querySnapshot = await FirebaseCollection.codes
            .where('pcSerialNo', isNull: true)
            .get();

        final CodesLicModel codes =
            CodesLicModel.fromMap(await querySnapshot.docs.first.data());
        activationCode = codes.activationCode ?? "";
        DocumentReference codeUpdate = await querySnapshot.docs.first.reference;
        await codeUpdate
            .update({'pcSerialNo': _user?.pcSerialNo}).then((value) {
          Utils.showSuccess(S.of(Get.context!).activationCodeCreatedSuccess);
        }).catchError((onError) {
          print(onError);
          Utils.showError(S.of(Get.context!).activationCodeCreatedError);
          _loading = false;
          update();
          return;
        });
      }

      final UserModel currentAdmin = await UserModel.fromJson(
          await CacheHelper.getSecure(key: KeyStorage.user));
      final us = UserModel(
        name: nameTEXT.text,
        accountType: _user?.accountType,
        companyName: companyNameTEXT.text,
        country: selectedCountry,
        email: emailTEXT.text,
        phone: phoneTEXT.text,
        createdAt: _user?.createdAt,
        fCM: _user?.fCM,
        pcSerialNo: _user?.pcSerialNo,
        pcStatus: _pcStatus,
        activationCode: activationCode,
        uid: _user?.uid,
        adminAccepted: currentAdmin.name,
        companyLicenseNo: _user?.companyLicenseNo,
        updateAt: parseDateTimeToString(
          DateTime.now(),
        ),
      ).toMap();
      final query = FirebaseCollection.technicalFR;

      await query
          .where('pcSerialNo', isEqualTo: _user?.pcSerialNo)
          .get()
          .then((value) {
        // Assuming there's only one document with a matching email
        DocumentReference userDoc = value.docs.first.reference;
        // Update the document
        userDoc.update(us).then((value) {
          Utils.showSuccess(S.of(Get.context!).updateUserSuccessfully);
          NotificationServiceImpl().pushNotification(
            deviceTokens: [_user?.fCM ?? ""],
            body: 'Your Request to Activate Systems is $pcStatus',
            title: _user?.companyName ?? "",
            data: {},
          );
        }).catchError((er) {
          Utils.showError(S.of(Get.context!).updateUserError(er));
        });
      }).catchError((e) {
        Utils.showError(S.of(Get.context!).updateUserError(e));
      });
      Get.back();
      _loading = false;
      update();
      // clearFormField();
    }
  }

  clearFormField() {
    emailTEXT.clear();
    nameTEXT.clear();
    companyNameTEXT.clear();
    phoneTEXT.clear();
    _pcStatus = '';
  }

  UserModel? _user;
  UserModel? get user => _user;
  onEditTechnical() {
    _user = UserModel.fromMap(Get.arguments);
    nameTEXT.text = _user?.name ?? "";
    companyNameTEXT.text = _user?.companyName ?? "";
    emailTEXT.text = _user?.email ?? "";
    pcSerialNo.text = _user?.pcSerialNo ?? "";
    phoneTEXT.text = _user?.phone ?? "";
    selectedCountry = _user?.country ?? "";
    _pcStatus = _user?.pcStatus ?? "";
    companyLicNoTEXT.text = _user!.companyLicenseNo.toString();
  }
}
