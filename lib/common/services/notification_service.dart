import 'dart:convert';
import 'package:get/get.dart';
import 'package:guard_master/common/app_constant/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:guard_master/common/routes/pages.dart';

abstract class NotificationService {
  requestPermission();
  Future<String?>? getFCMToken();
  initInfo();
  Future<void> pushNotification({
    required List<String> deviceTokens,
    required String body,
    required String title,
    required Map<String, dynamic> data,
  });
}

class NotificationServiceImpl implements NotificationService {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  NotificationServiceImpl() {
    requestPermission();
    initInfo();
  }

  @override
  requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      carPlay: false,
      badge: true,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User granted permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("User granted provisional permission");
    } else {
      print("User declined or has not accepted permission");
    }
  }

  @override
  Future<String?>? getFCMToken() async {
    //await Future.delayed(Duration(seconds: 1));
    return await _firebaseMessaging.getToken();
  }

  @override
  initInfo() async {
    final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) async {
        try {
          if (details.payload != null) {
            print(details.payload!);
          } else {
            Get.offAllNamed(PagesString.initial);
          }
        } catch (e) {
          print(e);
        }
        return;
      },
    );

    /// firebase massaging
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("--------------- On Messaging: ------------");
      print(
          "image: ${message.data['image']} \ntitle: ${message.notification!.title} \n${message.notification?.body}");

      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        contentTitle: message.notification!.title,
        htmlFormatContentTitle: true,
        htmlFormatBigText: true,
        summaryText: message.notification!.body,
        htmlFormatSummaryText: true,
      );
      AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
        'notification',
        'notification',
        styleInformation: bigTextStyleInformation,
        priority: Priority.high,
        playSound: true,
        sound: RawResourceAndroidNotificationSound('notification'),
        fullScreenIntent: true,
        enableLights: true,
        audioAttributesUsage: AudioAttributesUsage.voiceCommunication,
      );

      NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidNotificationDetails);
      await _flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        platformChannelSpecifics,
        payload: message.data["data"],
      );
    });
  }

  @override
  Future<void> pushNotification({
    required List<String> deviceTokens,
    required String body,
    required String title,
    required Map<String, dynamic> data,
  }) async {
    final List<Future<void>> futures = [];

    for (String token in deviceTokens) {
      futures.add(_sendNotification(token, title, body, data));
    }

    await Future.wait(futures);
  }

  Future<void> _sendNotification(String token, String title, String body,
      Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse("https://fcm.googleapis.com/fcm/send"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=${AppConstants.serverFCMKey}',
      },
      body: jsonEncode(
        <String, dynamic>{
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'status': 'done',
            'body': body,
            'title': title,
            'data': data,
            'image': AppConstants.logo,
          },
          'notification': <String, dynamic>{
            'title': title,
            'body': body,
            'android_channel_id': 'notification',
            'ios_channel_id': 'notification',
          },
          'to': token,
        },
      ),
    );

    if (response.statusCode == 200) {
      print('Notification sent to token: $token');
    } else {
      print('Failed to send notification to token: $token');
      print('Response: ${response.body}');
    }
  }
}
