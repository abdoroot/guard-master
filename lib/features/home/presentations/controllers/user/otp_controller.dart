import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/app_constant/app_constants.dart';
import 'package:guard_master/common/helper/cach.dart';
import 'package:guard_master/common/helper/date_time.dart';
import 'package:guard_master/common/services/firebase_ref.dart';
import 'package:guard_master/common/services/notification_service.dart';
import 'package:guard_master/common/utils/utils.dart';
import 'package:guard_master/features/home/data/models/request_model.dart';
import 'package:guard_master/features/home/data/models/user_model.dart';
import 'package:guard_master/features/home/presentations/controllers/home_controller.dart';
import 'package:guard_master/features/home/presentations/controllers/profile_controller.dart';
import 'package:guard_master/features/other_pages/congratulation_page.dart';
import 'package:guard_master/generated/l10n.dart';

class OTPRequestController extends GetxController {
  static OTPRequestController get to => Get.find<OTPRequestController>();
  GlobalKey<FormState> globalKey = GlobalKey();

  bool loading = false;
  String selectedCountry = AppConstants.country;

  int _requestNo = 0;
  int get requestNo => _requestNo;

  TextEditingController nameTEXT = TextEditingController();
  TextEditingController companyNameTEXT = TextEditingController();
  TextEditingController workTEXT = TextEditingController();

  onChangeCountry(Country country) {
    selectedCountry = country.displayName;
    update();
  }

  newRequestOTP() async {
    if (globalKey.currentState!.validate()) {
      loading = true;
      update();

      final UserModel u =
          UserModel.fromJson(await CacheHelper.getSecure(key: KeyStorage.user));

      final request = RequestModel(
        id: _requestNo,
        name: nameTEXT.text,
        companyName: companyNameTEXT.text,
        country: selectedCountry,
        technical_uid: u.uid,
        pcSerialNo: u.pcSerialNo,
        work: workTEXT.text,
        requestStatus: S.of(Get.context!).newRe,
        createdAt: parseDateTimeToString(
          DateTime.now(),
        ),
      );

      /// added request to collection
      final CollectionReference<Map<String, dynamic>> query =
          FirebaseCollection.requests;
      await query
          .doc(_requestNo.toString())
          .set(request.toMap())
          .then((value) async {
        List<String> tokens = [];

        /// send notification to admins

        await FirebaseCollection.adminsFR.get().then((value) {
          Get.to(() => CongratulationPageUSer(
              fromScreen: Get.currentRoute, requestNo: requestNo));

          value.docs
              .forEach((QueryDocumentSnapshot<Map<String, dynamic>> e) async {
            final admin = UserModel.fromMap(e.data());
            if (admin.fCM != null) {
              tokens.add(admin.fCM!);
            }
          });
          if (tokens.isNotEmpty) {
            NotificationServiceImpl().pushNotification(
              deviceTokens: tokens,
              title: HomeController.to.currentTechnical.first.companyName ?? "",
              body: workTEXT.text,
              data: {
                S.of(Get.context!).companyName:
                    HomeController.to.currentTechnical.first.companyName,
                S.of(Get.context!).work: workTEXT.text,
              },
            );
          }
        }).catchError((onError) => throw onError);
      }).catchError((e) => Utils.showError(e.message));
      loading = false;
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  onInit() async {
    Get.lazyPut(() => ProfileController());

    super.onInit();
  }

  clearFields() {
    nameTEXT.clear();
    companyNameTEXT.clear();
    workTEXT.clear();
  }

  Future<int> lengthREquests() async {
    final event = await FirebaseCollection.requests.get();
    _requestNo = await event.docs.length + 1;

    return _requestNo;
  }
}
