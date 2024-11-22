import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:genesia_demo/extensions/build_context_ext.dart';

class PermissionDialog extends StatelessWidget {
  static Future show({required BuildContext context, required String type}) {
    return showDialog(
      context: context,
      builder: (context) => PermissionDialog(
        type: type,
      ),
    );
  }

  final String type;

  const PermissionDialog({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      return CupertinoAlertDialog(
        title: const Text(
          "Need Access",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          "The app has been denied access to $type. You can grant it in app settings.",
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text("Cancel"),
            onPressed: () async {
              context.navigator.pop();
            },
          ),
          CupertinoDialogAction(
            child: const Text("Open Settings"),
            onPressed: () async {
              openAppSettings();
            },
          )
        ],
      );
    }else{
      return AlertDialog(
        title: const Text(
          "Need Access",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          "The app has been denied access to $type. You can grant it in app settings.",
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                context.navigator.pop();
              },
              child: const Text("Cancel")),
          TextButton(
              onPressed: () {
                openAppSettings();
              },
              child: const Text("Open Settings")),
        ],
      );
    }

  }
}
