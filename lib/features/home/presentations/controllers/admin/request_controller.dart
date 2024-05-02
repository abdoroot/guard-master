import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/app_constant/app_constants.dart';
import 'package:guard_master/common/helper/cach.dart';
import 'package:guard_master/common/helper/date_time.dart';
import 'package:guard_master/common/helper/random_codes.dart';
import 'package:guard_master/common/services/notification_service.dart';
import 'package:guard_master/common/services/firebase_ref.dart';
import 'package:guard_master/common/utils/utils.dart';
import 'package:guard_master/features/home/data/models/request_model.dart';
import 'package:guard_master/features/home/data/models/user_model.dart';
import 'package:guard_master/features/splash/data/models/codes_lic_model.dart';
import 'package:guard_master/generated/l10n.dart';

class RequestAdminController extends GetxController {
  static RequestAdminController get to => Get.find();
  GlobalKey<FormState> globalKey = GlobalKey();

  bool loading = false;

  TextEditingController nameTEXT = TextEditingController();
  TextEditingController companyNameTEXT = TextEditingController();
  String selectedCountry = AppConstants.country;
  String? requestStatus;
  String? id;
  TextEditingController workTEXT = TextEditingController();

  onChangeRequest(String status) {
    requestStatus = status;
    update();
  }

  onChangeCountry(Country country) {
    selectedCountry = country.displayName;
    update();
  }

  editRequest() async {
    loading = true;
    update();
    final UserModel u =
        UserModel.fromJson(await CacheHelper.getSecure(key: KeyStorage.user));
    String admins = u.name ?? "";

    if (requestStatus == AppConstants.statusOfRequest.first) {
      String otp = '';

      await FirebaseCollection.codes
          .where('pcSerialNo', isEqualTo: _oldReq?.pcSerialNo)
          .get()
          .then((QuerySnapshot<Map<String, dynamic>> value) async {
        final codes = CodesLicModel.fromMap(await value.docs.first.data());

        otp = getRandomValueFromList(codes.otp ?? []);

        await _updateRequest(
          request: RequestModel(
            requestStatus: requestStatus,
            id: _oldReq?.id,
            name: nameTEXT.text,
            companyName: companyNameTEXT.text,
            adminAccepted: admins,
            country: selectedCountry,
            createdAt: _oldReq?.createdAt,
            technical_uid: _oldReq?.technical_uid,
            work: workTEXT.text,
            pcSerialNo: _oldReq?.pcSerialNo,
            updateAt: parseDateTimeToString(
              DateTime.now(),
            ),
            otp: otp,
          ),
        );
      }).catchError((e) {
        Utils.showError(S.of(Get.context!).errorUpdatingRequestError(e));
      });
      Utils.showSuccess(S.of(Get.context!).requestUpdatedSuccessfully);
    } else {
      try {
        await _updateRequest(
          request: RequestModel(
            requestStatus: requestStatus,
            id: _oldReq?.id,
            name: nameTEXT.text,
            companyName: companyNameTEXT.text,
            adminAccepted: admins,
            country: selectedCountry,
            createdAt: _oldReq?.createdAt,
            technical_uid: _oldReq?.technical_uid,
            work: workTEXT.text,
            pcSerialNo: _oldReq?.pcSerialNo,
            updateAt: parseDateTimeToString(
              DateTime.now(),
            ),
          ),
        );
        Utils.showSuccess(S.of(Get.context!).requestUpdatedSuccessfully);
      } catch (e) {
        Utils.showError(S.of(Get.context!).errorUpdatingRequestError(e));
      }
    }
    loading = false;
    update();
    if (Navigator.canPop(Get.context!)) {
      Navigator.pop(Get.context!);
    }
  }

  _updateRequest({required RequestModel request}) async {
    final CollectionReference<Map<String, dynamic>> query =
        FirebaseCollection.requests;
    query
        .doc(request.id.toString())
        .update(request.toMap())
        .then((value) async {
      List<String> tokens = [];

      /// send notification to technical or admin
      await FirebaseCollection.technicalFR
          .where('uid', isEqualTo: request.technical_uid)
          .get()
          .then((value) async {
        final tec = await UserModel.fromMap(value.docs.first.data());
        if (tec.fCM != null) {
          tokens.add(tec.fCM!);
        }
        if (tokens.isNotEmpty) {
          NotificationServiceImpl().pushNotification(
            deviceTokens: tokens,
            body: request.work ?? "",
            title: requestStatus ?? "",
            data: {
              S.of(Get.context!).name: request.name,
              S.of(Get.context!).companyName: request.companyName,
            },
          );
        }
      }).catchError((onError) => throw onError);
    }).catchError((e) {
      loading = false;
      update();
      throw e;
    });
  }

  RequestModel? _oldReq;

  onEditOpen() {
    final req = Get.arguments;
    _oldReq = RequestModel.fromMap(req);
    nameTEXT.text = _oldReq?.name ?? "";
    companyNameTEXT.text = _oldReq?.companyName ?? "";
    requestStatus = _oldReq?.requestStatus ?? "";
    selectedCountry = _oldReq?.country ?? "";
    workTEXT.text = _oldReq?.work ?? "";
    id = _oldReq?.id.toString();
  }

  int currentTab = 0;
  late PageController tabController = PageController(initialPage: currentTab);

  onChangePage(int index) {
    currentTab = index;
    update();
  }

  onTap(int index) {
    currentTab = index;
    tabController.animateToPage(currentTab,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOutSine);
    update();
  }
}
