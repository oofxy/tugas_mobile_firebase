import 'dart:typed_data';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NotificationController extends GetxController {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  String? token = '';

  Rx<RemoteMessage?> notification = Rx<RemoteMessage?>(null);

  @override
  void onInit() {
    super.onInit();
    _initializeFirebaseMessaging();
    _initializeLocalNotifications();
    _printFcmToken();

    print('hello');
  }

  void _printFcmToken() async {
    token = await _messaging.getToken();
    print("FCM Token: $token");
  }

  void _initializeFirebaseMessaging() {
    _messaging.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      notification.value = message;
      print('Foreground Message Received: ${message.notification?.title}');
      _showForegroundNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data['route'] != null) {
        // TODO: route stuff
      }
    });
  }

  void _initializeLocalNotifications() {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);

    _localNotificationsPlugin.initialize(initializationSettings);
  }

  void _showForegroundNotification(RemoteMessage message) async {
    final String? imageUrl = message.notification?.android?.imageUrl;
    print(imageUrl);

    if (imageUrl != null) {
      // Download the image
      final Uint8List imageBytes = await _getImageBytes(imageUrl);

      // Use BigPictureStyle for the notification
      final BigPictureStyleInformation bigPictureStyleInformation =
      BigPictureStyleInformation(
          ByteArrayAndroidBitmap(imageBytes),
          contentTitle: message.notification?.title,
          summaryText: message.notification?.body,
          largeIcon: ByteArrayAndroidBitmap(imageBytes)
      );

      final AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        channelDescription: 'channel_description',
        styleInformation: bigPictureStyleInformation,
        importance: Importance.high,
        priority: Priority.high,
      );

      final NotificationDetails notificationDetails =
      NotificationDetails(android: androidDetails);

      _localNotificationsPlugin.show(
        message.notification.hashCode,
        message.notification?.title,
        message.notification?.body,
        notificationDetails,
      );
    } else {
      // Fallback to standard notification
      const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        channelDescription: 'channel_description',
        importance: Importance.high,
        priority: Priority.high,
      );

      const NotificationDetails notificationDetails =
      NotificationDetails(android: androidDetails);

      _localNotificationsPlugin.show(
        message.notification.hashCode,
        message.notification?.title,
        message.notification?.body,
        notificationDetails,
      );
    }
  }

// Helper method to download image bytes
  Future<Uint8List> _getImageBytes(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load image');
    }
  }
}