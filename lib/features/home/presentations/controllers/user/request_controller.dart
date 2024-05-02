import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/services/launcher.dart';
import 'package:guard_master/features/home/data/models/request_model.dart';
 import 'package:share_plus/share_plus.dart';

class RequestUserController extends GetxController {
  static RequestUserController get to => Get.find();
  int currentTab = 0;
  late PageController tabController = PageController(initialPage: currentTab);
  bool sent = false;
  final emailTEXT = TextEditingController();
  late RequestModel messageData;

 
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

  onWorkFilm() {
    messageData = Get.arguments;
  }

  sherVideo(String url) {
    Share.share('check out my work $url');
  }

  Future<void> sendEmail() async {
    sent = true;
    update();

    await WebSiteLaunch.launcher(emailTEXT.text,
        name: messageData.companyName ?? "",
        message:
            "Hello ${emailTEXT.text.split("@").first}\n\nIt is my work...\n\n${messageData.workFilm}\n\nBest Wishes\n${messageData.companyName}");
    sent = false;
    update();
  }
}
