import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:genesia_demo/utils/common_button.dart';
import 'package:genesia_demo/utils/common_functions.dart';

class ImagePickerWidget extends StatefulWidget {
  final Widget child;
  final bool multiSelect;
  final bool fromCamera;
  final Function(File file)? onSelect;
  final Function(List<File> files)? onMultiSelect;

  ImagePickerWidget(
      {super.key,
      required this.child,
      this.multiSelect = false,
      this.fromCamera = false,
      this.onSelect,
      this.onMultiSelect}) {
    if (onSelect != null && onMultiSelect != null) {
      throw ArgumentError("Only one callback function can be provided.");
    }
    if(multiSelect && fromCamera){
      throw ArgumentError("Multi select work on only from gallery");
    }
  }

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return CommonButton.cupertino(
        onTap: () {
          _pickImage(multiSelect: widget.multiSelect,onSelect: widget.onSelect,onMultiSelect: widget.onMultiSelect);
        },
        child: widget.child);
  }

  Future<void> _pickImage(
      {required bool multiSelect,
      Function(File file)? onSelect,
      Function(List<File> files)? onMultiSelect}) async {
    if (await _checkPermission(context)) {
      final ImagePicker picker = ImagePicker();
      if (multiSelect) {
        final List<XFile> images = await picker.pickMultiImage();

        if (images.isNotEmpty && onMultiSelect != null) {
          onMultiSelect(images.map((e) => File(e.path)).toList());
        }
      } else {
        final XFile? image = await picker.pickImage(
          source: widget.fromCamera? ImageSource.camera:ImageSource.gallery,
        );
        if (image != null && onSelect != null) {
          onSelect(File(image.path));
        }
      }
    }
  }

  Future<bool> _checkPermission(BuildContext context) async {
    late Permission permission;
    if (Platform.isIOS || await CommonFunc.getAndroidVersion() >= 33) {
      permission = Permission.photos;
    } else {
      permission = Permission.storage;
    }
    if(context.mounted){

    return CommonFunc.checkPermission(context: context, permission: permission);
    }
    return false;
  }
}
