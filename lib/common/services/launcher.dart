import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:guard_master/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class WebSiteLaunch {
  static launcher(
    String url, {
    String? name,
    String? message,
    String? subject = "Guard master Video",
  }) async {
    if (url.contains('http')) {
      await launchUrl(Uri.parse(url));
    } else if (RegExp(r'\S+@\S+\.\S+').hasMatch(url)) {
      final mail = Uri(
        scheme: 'mailto',
        path: url,
        query: _encodeQueryParameters(<String, String>{
          'subject': "Guard master video",
          "body": message!,
        }),
      );
      if (await canLaunchUrl(mail)) {
        launchUrl(mail);
      } else {
        throw Exception("Could not launcher $mail");
      }
    } else if (RegExp(r'^\+971\d{8}$').hasMatch(url)) {
      log("is Phone");
      await launchUrl(Uri.parse("tel:$url"));
    }
  }

  static String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

/* 
  static Future<Either<String, bool>> send({
    required String toEmail,
    required String name,
    required String message,
    String? subject = "Guard master Video",
  }) async {
    final Email email = Email(
      body: message,
      subject: subject!,
      recipients: [toEmail],
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
      return Right(true);
    } catch (error) {
      print(error);
      return Left("Video not send: $error");
    }
  }
 */
  static final String _whatsAppMessage = '';

  static openWhatsApp(BuildContext context, String whatsapp) async {
    // String whatsapp = url!;
    String whatsappURlAndroid =
        "whatsapp://send?phone=" + whatsapp + "&text=$_whatsAppMessage";
    var whatAppURLIOS =
        "https://wa.me/$whatsapp?text=${Uri.parse(_whatsAppMessage)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatAppURLIOS))) {
        await launchUrl(Uri.parse(whatAppURLIOS));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).whatsappNoInstalled)));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).whatsappNoInstalled)));
      }
    }
  }
}
