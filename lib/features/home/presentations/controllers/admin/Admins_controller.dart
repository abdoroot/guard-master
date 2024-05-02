import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/app_constant/app_constants.dart';
import 'package:guard_master/common/helper/cach.dart';
import 'package:guard_master/common/helper/date_time.dart';
import 'package:guard_master/common/services/firebase_ref.dart';
import 'package:guard_master/common/utils/utils.dart';
import 'package:guard_master/features/home/data/models/user_model.dart';
import 'package:guard_master/generated/l10n.dart';

class AdminsController extends GetxController {
  static AdminsController get to => Get.find();
  List<UserModel> _admins = <UserModel>[];
  List<UserModel> get admins => _admins;

  bool loading = false;
  GlobalKey<FormState> globalKey = GlobalKey();

  TextEditingController nameTEXT = TextEditingController();
  TextEditingController phoneTEXT = TextEditingController();
  TextEditingController emailTEXT = TextEditingController();
  TextEditingController companyNameTEXT = TextEditingController();

  String selectedCountry = AppConstants.country;
  String _accountType = AppConstants.accountType.first;
  String get accountType => _accountType;
  bool _loadingAdd = false;
  bool get loadingAdd => _loadingAdd;
  String _pcStatus = '';
  String get pcStatus => _pcStatus;

  changePCStatus(String status) {
    _pcStatus = status;
    update();
  }

  addNewAdmin() async {
    if (globalKey.currentState!.validate()) {
      if (_accountType.isNotEmpty) {
        _loadingAdd = true;
        update();
        final user = UserModel(
          name: nameTEXT.text,
          accountType: accountType,
          companyLicenseNo: int.parse(AppConstants.licenseNo),
          companyName: companyNameTEXT.text,
          country: selectedCountry,
          email: emailTEXT.text,
          pcStatus: _pcStatus,
          phone: phoneTEXT.text,
          createdAt: parseDateTimeToString(
            DateTime.now(),
          ),
        ).toMap();
        final query = accountType == KeyStorage.typeTechnical
            ? FirebaseCollection.technicalFR
            : FirebaseCollection.adminsFR;
        query.add(user).then((value) {
          Utils.showSuccess(S.of(Get.context!).addedSuccesses);
        }).catchError((e) {
          Utils.showError(S.of(Get.context!).canNotAdd(e));
        });
        getAllAdmins();
        _loadingAdd = false;
        update();
        clearFormField();
        Get.back();
      }
    }
  }

  getAllAdmins() async {
    _admins.clear();
    loading = true;
    update();
    final QuerySnapshot<Map<String, dynamic>> event =
        await FirebaseCollection.adminsFR.get();
    event.docs.forEach((QueryDocumentSnapshot<Map<String, dynamic>> e) async {
      final data = UserModel.fromMap(e.data());
      _admins.add(data);
    });
    loading = false;
    update();
  }

  editAdmin() async {
    if (globalKey.currentState!.validate()) {
      if (_accountType.isNotEmpty) {
        _loadingAdd = true;
        update();
        final us = UserModel(
          name: nameTEXT.text,
          accountType: accountType,
          companyName: companyNameTEXT.text,
          country: selectedCountry,
          email: emailTEXT.text,
          phone: phoneTEXT.text,
          createdAt: _user.createdAt,
          fCM: _user.fCM,
          pcSerialNo: _user.pcSerialNo,
          pcStatus: _pcStatus,
          uid: _user.uid,
          adminAccepted: _user.adminAccepted,
          companyLicenseNo: _user.companyLicenseNo,
          updateAt: parseDateTimeToString(
            DateTime.now(),
          ),
        ).toMap();
        final query = accountType == KeyStorage.typeTechnical
            ? FirebaseCollection.technicalFR
            : FirebaseCollection.adminsFR;

        await query
            .where('pcSerialNo', isEqualTo: _user.pcSerialNo)
            .get()
            .then((value) {
          // Assuming there's only one document with a matching email
          DocumentReference userDoc = value.docs.first.reference;
          // Update the document
          userDoc
              .update(us)
              .then((value) =>
                  Utils.showSuccess(S.of(Get.context!).updateUserSuccessfully))
              .catchError((er) {
            Utils.showError(S.of(Get.context!).updateUserError(er));
          });
        }).catchError((e) {
          Utils.showError(S.of(Get.context!).updateUserError(e));
        });
        getAllAdmins();
        Get.back();
        _loadingAdd = false;
        update();
        clearFormField();
      }
    }
  }

  clearFormField() {
    emailTEXT.clear();
    nameTEXT.clear();
    companyNameTEXT.clear();
    phoneTEXT.clear();
    _accountType = '';
    _pcStatus = '';
  }

  late UserModel _user;
  UserModel get user => _user;
  onEditAdmin() {
    _user = UserModel.fromMap(Get.arguments);
    nameTEXT.text = _user.name ?? "";
    companyNameTEXT.text = _user.companyName ?? "";
    emailTEXT.text = _user.email ?? "";
    phoneTEXT.text = _user.phone ?? "";
    _accountType = _user.accountType ?? "";
    _pcStatus = _user.pcStatus ?? "";
  }

  @override
  void onInit() async {
    await getAllAdmins();
    super.onInit();
  }
}
