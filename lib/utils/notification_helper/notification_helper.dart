import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart';

class NotificationHelper {
  NotificationHelper._();

  static final NotificationHelper _instance = NotificationHelper._();

  static NotificationHelper get instance => _instance;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  ///Settings for android notification
  AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');

  late AndroidNotificationDetails androidPlatformChannelSpecifics;
  late NotificationDetails notificationDetails;

  ///Settings for IOS notification
  final DarwinInitializationSettings initializationSettingsDarwin = const DarwinInitializationSettings();

  Future<void> initialize() async {
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: onDidReceiveBackgroundNotificationResponse,
    );

    // ///Asking for permission on android 13+

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    androidPlatformChannelSpecifics = const AndroidNotificationDetails('channelId', 'channelName',
        importance: Importance.max, priority: Priority.high, ticker: 'ticker');
    notificationDetails = NotificationDetails(android: androidPlatformChannelSpecifics);
    secheduleNotification();
  }

  static void onDidReceiveLocalNotificationIos(int id, String? title, String? body, String? payload) {
    print("onDidReceiveLocalNotificationIos===> ${payload}");
  }

  void onDidReceiveNotificationResponse(NotificationResponse message) {
    ///when app is open and got notification
    print("onDidReceiveNotificationResponse===> ${message.payload}");
    if (message.payload != null) {
      onNotificationTap(jsonDecode(message.payload!));
    }
  }

  void onNotificationTap(Map<String, dynamic> data) {
    print("onNotificationTap==> $data");
  }

  Future<void> secheduleNotification() async {
    flutterLocalNotificationsPlugin.cancelAll();
    final now = DateTime.now();
    DateTime initDateTime = DateTime(now.year, now.month, now.day, now.hour, now.minute);
    notifications.shuffle();
    if (initDateTime.isBefore(DateTime.now())) {
      initDateTime = initDateTime.add(const Duration(minutes: 1));
    }
    for (int i = 0; i < 14; i++) {
      print('initDateTime: ${initDateTime}');

      await setNotification(
          setDateTime: initDateTime, title: notifications[i]['title'], desc: notifications[i]['description'], id: i);
      initDateTime = initDateTime.add(const Duration(hours: 4));
    }
  }

  Future<void> setNotification(
      {required DateTime setDateTime, required String title, required String desc, required int id}) async {
    print(TZDateTime(local, setDateTime.year, setDateTime.month, setDateTime.day, setDateTime.hour, setDateTime.minute));

    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        desc,
        TZDateTime.from(
          setDateTime,
          local,
        ),
        notificationDetails,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,

        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
  }
}

@pragma('vm:entry-point')
void onDidReceiveBackgroundNotificationResponse(NotificationResponse message) {
  print("onDidReceiveBackgroundNotificationResponse===> ${message.payload}");
  NotificationHelper.instance.onNotificationTap(jsonDecode(message.payload ?? ""));
}

class NotificationData {
  final String title;
  final String body;
  final String id;

  NotificationData({required this.title, required this.body, required this.id});
}

List<Map> notifications = [
  {"title": "Chat with Your AI Friend!", "description": "Your friend is waiting to talk. Start a conversation now!"},
  {"title": "New Topics Unlocked! 🎉", "description": "Discover new and exciting things to chat about with your AI friend."},
  {"title": "Daily Chat Reminder", "description": "Don't forget to catch up with your AI friend today!"},
  {"title": "Boost Your Day! ☀️", "description": "Spend a few minutes chatting with your AI friend to brighten up your day."},
  {"title": "Discover AI Friend's Secrets", "description": "Your AI friend has something interesting to share. Open the app to find out!"},
  {"title": "Friendly Reminder", "description": "Your AI friend misses you! Come back and chat."},
  {"title": "Special Conversations Await", "description": "Unlock new and engaging conversations with your AI friend."},
  {"title": "Stay Connected", "description": "Keep your friendship strong by chatting with your AI friend regularly."},
  {"title": "Your AI Friend Needs You!", "description": "Join the chat and make your AI friend’s day better."},
  {"title": "Enhance Your Friendship", "description": "Learn new things and have fun with your AI friend. Chat now!"},
  {"title": "Unlock New Features! 🎁", "description": "Check out the latest updates and enhancements in your AI friend app."},
  {"title": "Explore Together", "description": "Discover new ideas and topics with your AI friend today."},
  {"title": "Your Daily Dose of Fun", "description": "Chat with your AI friend for a fun and exciting experience."},
  {"title": "Special Surprise! 🎉", "description": "Your AI friend has a surprise for you. Open the app to see it!"}
]
;