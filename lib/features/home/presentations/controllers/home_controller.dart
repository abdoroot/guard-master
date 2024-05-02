import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/helper/cach.dart';
import 'package:guard_master/common/helper/date_time.dart';
import 'package:guard_master/common/services/firebase_ref.dart';
import 'package:guard_master/common/utils/utils.dart';
import 'package:guard_master/features/home/data/models/request_model.dart';
import 'package:guard_master/features/home/data/models/user_model.dart';
import 'package:guard_master/generated/l10n.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  bool _loading = false;
  bool get loading => _loading;

  String accountType = '';

  List<UserModel> _techniciansAll = <UserModel>[];
  List<UserModel> get techniciansAll => _techniciansAll;
  List<UserModel> _currentTechnical = <UserModel>[];
  List<UserModel> get currentTechnical => _currentTechnical;

  List<RequestModel> _requests = <RequestModel>[];
  List<RequestModel> get requests => _requests;
  List<RequestModel> _newRequests = <RequestModel>[];
  List<RequestModel> get newRequests => _newRequests;
  List<RequestModel> _oldRequests = <RequestModel>[];
  List<RequestModel> get oldRequests => _oldRequests;
  List<RequestModel> _currentTechnicalRequests = <RequestModel>[];
  List<RequestModel> get currentTechnicalRequests => _currentTechnicalRequests;
  List<RequestModel> _currentTechnicalNewRequests = <RequestModel>[];
  List<RequestModel> get currentTechnicalNewRequests =>
      _currentTechnicalNewRequests;
  List<RequestModel> _currentTechnicalOldRequests = <RequestModel>[];
  List<RequestModel> get currentTechnicalOldRequests =>
      _currentTechnicalOldRequests;

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllRequests() {
    final Stream<QuerySnapshot<Map<String, dynamic>>> event =
        FirebaseCollection.requests.snapshots();
    _requests.clear();
    _newRequests.clear();
    _oldRequests.clear();
    _currentTechnicalRequests.clear();
    _currentTechnicalNewRequests.clear();
    _currentTechnicalOldRequests.clear();
    event.forEach((QuerySnapshot<Map<String, dynamic>> e) async {
      e.docs.forEach((element) {
        final RequestModel request = RequestModel.fromMap(element.data());
        _requests.add(request);
        if (request.technical_uid == FirebaseAuth.instance.currentUser?.uid) {
          _currentTechnicalRequests.add(request);
          if (request.requestStatus == S.of(Get.context!).newRe) {
            _currentTechnicalNewRequests.add(request);
          } else
            _currentTechnicalOldRequests.add(request);
        }
        if (request.requestStatus == S.of(Get.context!).newRe) {
          _newRequests.add(request);
        } else
          _oldRequests.add(request);
      });
      _currentTechnicalNewRequests.sort((RequestModel a, RequestModel b) =>
          parseStringToDateTime(b.createdAt!)
              .compareTo(parseStringToDateTime(a.createdAt!)));

      _currentTechnicalOldRequests.sort((RequestModel a, RequestModel b) =>
          parseStringToDateTime(b.createdAt!)
              .compareTo(parseStringToDateTime(a.createdAt!)));

      _oldRequests.sort((RequestModel a, RequestModel b) =>
          parseStringToDateTime(b.createdAt!)
              .compareTo(parseStringToDateTime(a.createdAt!)));

      _requests.sort((RequestModel a, RequestModel b) =>
          parseStringToDateTime(b.createdAt!)
              .compareTo(parseStringToDateTime(a.createdAt!)));

      _newRequests.sort((RequestModel a, RequestModel b) =>
          parseStringToDateTime(b.createdAt!)
              .compareTo(parseStringToDateTime(a.createdAt!)));
    });

    return event;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllTechnicians() {
    final Stream<QuerySnapshot<Map<String, dynamic>>> event =
        FirebaseCollection.technicalFR.snapshots();
    _techniciansAll.clear();
    _currentTechnical.clear();
    event.forEach((QuerySnapshot<Map<String, dynamic>> e) async {
      e.docs.forEach((element) {
        final UserModel data = UserModel.fromMap(element.data());
        if (accountType == KeyStorage.typeAdmin) {
          _techniciansAll.add(data);
        }
        if (accountType == KeyStorage.typeTechnical &&
            data.uid == FirebaseAuth.instance.currentUser?.uid) {
          _currentTechnical.add(data);
          CacheHelper.saveSecure(key: KeyStorage.user, value: data.toJson());
        }
      });

      _techniciansAll.sort((UserModel a, UserModel b) =>
          parseStringToDateTime(b.createdAt!)
              .compareTo(parseStringToDateTime(a.createdAt!)));
    });

    return event;
  }

  saveBadgerAdmin(int length) async {
    await CacheHelper.saveData(key: KeyStorage.badgerCounter, value: length);
  }

  int? counterNotification;
  bool badgerCounter() {
    final int? counter = CacheHelper.getData(key: KeyStorage.badgerCounter);
    if (counter != null) {
      int counterNotification1 = _requests.length - counter;
      int counterNotification2 = _currentTechnicalRequests.length - counter;

      accountType == KeyStorage.typeAdmin
          ? counter < _requests.length
              ? counterNotification = counterNotification1
              : false
          : counter < _currentTechnicalRequests.length
              ? counterNotification = counterNotification2
              : false;
      update();
      if (counterNotification == counter || counterNotification == null) {
        return false;
      }
      return true;
    }

    return false;
  }

  @override
  void onInit() async {
    accountType = await CacheHelper.getData(key: KeyStorage.accountType);

    Future.delayed(
      Duration(seconds: 2),
      () {
        Get.put(HomeController());
      },
    );
    update();
    super.onInit();
  }

  int selectedIndex = 4;
  late PageController controller = PageController(initialPage: selectedIndex);
  onPageChange(int index) {
    selectedIndex = index;
    update();
  }

  onTap(int index) {
    selectedIndex = index;
    controller.animateToPage(selectedIndex,
        duration: Duration(microseconds: 300), curve: Curves.easeIn);
    update();
  }

  DateTime? currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Utils.showToast(S.of(Get.context!).pressAgainToExit);
      return Future.value(false);
    }
    exit(0);
  }
}
