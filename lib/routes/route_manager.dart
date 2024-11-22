import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genesia_demo/modules/chat/chat.dart';
import 'package:genesia_demo/modules/dashboard/dashboard.dart';
import 'package:genesia_demo/modules/onBorading/welcome/welcome.dart';
import 'package:genesia_demo/modules/settings/settings.dart';
import 'package:genesia_demo/modules/splash/splash.dart';

import '../modules/onBorading/onBoard/onboard.dart';

class RouteManager {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    debugPrint("Current Route :  ${settings.name}");
    switch (settings.name) {
      // splash
      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: SplashScreen.builder,
          settings: settings,
        );
      // onboard WelcomeScreen
      case WelcomeScreen.routeName:
        return CupertinoPageRoute(
          builder: WelcomeScreen.builder,
          settings: settings,
        );

      // onboard enter your name
      case OnboardScreen.routeName:
        return CupertinoPageRoute(
          builder: OnboardScreen.builder,
          settings: settings,
        );
    // Dashboard
      case DashboardScreen.routeName:
        return CupertinoPageRoute(
          builder: DashboardScreen.builder,
          settings: settings,
        );
    // Settings
      case SettingsScreen.routeName:
        return CupertinoPageRoute(
          builder: SettingsScreen.builder,
          settings: settings,
        );

    // Chat
      case ChatScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => const ChatScreen(),
          settings: settings,
        );

    }
    return null;
  }

  static String get initRoute => SplashScreen.routeName;
}
