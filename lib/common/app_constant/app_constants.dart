import 'package:get/get.dart';
import 'package:guard_master/generated/l10n.dart';

class AppConstants {
  static String componyWhatsApp = '+971555522314';
  static String componyEmail = 'info@guardmaster.ae';
  static String componyPhone = '+97142852232';
  static String favCountryCode = '+971';
  static String country = 'United Arab Emirates';

  static List<String> statusOfRequest = <String>[
    S.of(Get.context!).approved,
    S.of(Get.context!).rejected,
  ];
  static List<String> statusOfActivation = <String>[
    S.of(Get.context!).active,
    S.of(Get.context!).notActive,
  ];

  static int timeOut = 60;

  static int codeLength = 6;
  static int phoneLength = 13;
  static String licenseNo = "717809";

  static List<String> accountType = [
    // S.of(Get.context!).technical,
    S.of(Get.context!).admin
  ];

  /// sender notification
  static String serverFCMKey =
      'AAAAI6J6i8A:APA91bFSLiZqPcnUBRkAcZeMsykw1R0nRUd8S9enIRgZ4VcCP60ASYKkTD_xi1tBTQz-WX7Y95tc093ZDPs5vXi3vBewleo0tDqj9lhUO9xoSCXgrOKgCEqzR34aDMRT_q_C9fVGpI6h';

  static String logo =
      "https://firebasestorage.googleapis.com/v0/b/guard-master-2e8fe.appspot.com/o/app_const%2Flogo.svg?alt=media&token=440bdf67-862e-43c5-a143-448bdbe7eb74&_gl=1*107h4qx*_ga*MjA0MjE5NzQzMi4xNjk0MDQ0NzAw*_ga_CW55HF8NVT*MTY5NjE2MTkzOS4xNS4xLjE2OTYxNjIxMzcuMjcuMC4w";

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: 'en.png',
        languageName: "English",
        countryCode: "US",
        languageCode: "en"),
    LanguageModel(
        imageUrl: 'ar.png',
        languageName: "العربية",
        countryCode: "eg",
        languageCode: "ar"),
  ];
}

class LanguageModel {
  final String imageUrl;
  final String languageName;
  final String countryCode;
  final String languageCode;

  LanguageModel({
    required this.imageUrl,
    required this.languageName,
    required this.countryCode,
    required this.languageCode,
  });
}
