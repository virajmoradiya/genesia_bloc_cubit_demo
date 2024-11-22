import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:genesia_demo/components/dialogs/permission_dialog.dart';
import 'package:genesia_demo/extensions/build_context_ext.dart';
import 'package:genesia_demo/extensions/int_ext.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vibration/vibration.dart';

import 'enums.dart';

class CommonFunc {
  static void closeKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  static void showSnackBar({required BuildContext context, required String msg, SnackBarType type = SnackBarType.success}) {
    var snackBar = SnackBar(
      content: Text(
        msg,
        style: context.textTheme.bodyLarge?.copyWith(color: context.colorScheme.onSurface),
      ),
      backgroundColor: type == SnackBarType.success ? context.colorScheme.primary : context.colorScheme.error,
      duration: 2.seconds,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<int> getAndroidVersion() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.version.sdkInt;
  }

  static Future<bool> checkPermission({required BuildContext context, required Permission permission}) async {
    final status = await permission.status;
    switch (status) {
      case PermissionStatus.denied:
        return await permission.request().isGranted;
      case PermissionStatus.granted:
        return true;
      case PermissionStatus.restricted:
        return false;
      case PermissionStatus.limited:
        return true;
      case PermissionStatus.permanentlyDenied:
        if (context.mounted) {
          PermissionDialog.show(context: context, type: permission.toString());
        }
        return false;
      case PermissionStatus.provisional:
        return false;
    }
  }


  static Future<void> vibrate({int duration = 50,int amplitude = 10}) async {

    if (await Vibration.hasVibrator()??false) {
      if (await Vibration.hasCustomVibrationsSupport()??false) {
        Vibration.vibrate(duration: duration,amplitude: amplitude);
      } else {
        Vibration.vibrate();
        await Future.delayed((duration/2).round().milliseconds);
        Vibration.vibrate();
      }
    }
  }
}
