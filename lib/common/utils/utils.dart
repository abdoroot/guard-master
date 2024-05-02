import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guard_master/common/resources/app_color.dart';
import 'package:guard_master/common/widgets/custom_text.dart';
import 'package:lottie/lottie.dart';
import 'package:guard_master/common/utils/extension.dart';
import 'package:guard_master/common/widgets/loading_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  /// SHOW TOAST
  static showToast(
    String message, {
    ToastGravity? gravity = ToastGravity.TOP,
    Toast? toastLength = Toast.LENGTH_SHORT,
    Color? backgroundColor = AppColors.black,
    Color? textColor = AppColors.white,
  }) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength, // Duration of the toast
      gravity: gravity, // Toast position
      timeInSecForIosWeb: 1, // Time for iOS/WEB
      backgroundColor: backgroundColor, // Background color of the toast
      textColor: textColor, // Text color of the toast
    );
  }

  /// SUCCESS NOTIFICATION
  static showSuccess(String message) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
    Get.rawSnackbar(
      message: message.tr,
      barBlur: 5,
      maxWidth: Get.width,

      snackPosition: SnackPosition.TOP,
      // backgroundColor: ColorManager.green.withOpacity(0.7),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    );
  }

  /// ERROR NOTIFICATION
  static showError(String message) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
    Get.rawSnackbar(
      message: message,
      barBlur: 5,
      maxWidth: Get.width,
      backgroundColor: Colors.red,

      snackPosition: SnackPosition.TOP,
      // backgroundColor: ColorManager.red.withOpacity(0.7),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    );
  }

  static customBottomSheet({
    String? title,
    List<Widget>? children,
    Color? titleTextColor = AppColors.black,
  }) {
    return Get.bottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.w),
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title ?? "",
              style: Theme.of(Get.context!)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: titleTextColor),
            ),
            2.w.sh,
            if (children != null)
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children),
          ],
        ),
      ),
      isDismissible: true,
      elevation: 0,
      enableDrag: false,
      backgroundColor: Colors.white,
    );
  }

  static showBottomSheet({
    String? title,
    List<String>? listData,
  }) {
    return Get.bottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title ?? "",
                style: Theme.of(Get.context!)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Colors.black),
              ),
              2.w.sh,
              if (listData != null && listData.isNotEmpty)
                ...listData
                    .map((e) => Container(
                          width: 100.w,
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () {
                                Get.back(result: e);
                              },
                              child: CustomText(text: e)),
                        ))
                    .toList(),
            ],
          ),
        ),
      ),
      isDismissible: false,
      elevation: 0,
      enableDrag: false,
      backgroundColor: Colors.white,
    );
  }

  static showLottieDialog(
      {required String lottie, required String text, List<Widget>? action}) {
    Get.dialog(
      Dialog(
        child: WillPopScope(
          onWillPop: () async => false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              LottieBuilder.asset(
                lottie,
              ),
              10.sh,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                ),
              ),
              20.sh,
              if (action != null) ...[
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: action,
                  ),
                ),
                20.sh,
              ],
            ],
          ),
        ),
      ),
    );
  }

// method for show loading
  static void showLoading({String? message}) {
    Get.dialog(
      Dialog(
        child: WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              height: 350,
              child: LoadingWidget(
                description: message,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
