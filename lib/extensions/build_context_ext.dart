import 'package:flutter/material.dart';
import 'package:genesia_demo/generated/l10n.dart';
import 'package:genesia_demo/utils/common_functions.dart';
import 'package:genesia_demo/utils/enums.dart';

extension Ext on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;

  double get width => MediaQuery.sizeOf(this).width;

  EdgeInsets get padding => MediaQuery.paddingOf(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get theme => Theme.of(this);

  NavigatorState get navigator => Navigator.of(this);

  dynamic get args => ModalRoute.of(this)?.settings.arguments;


  S get l10n => S.of(this);

  void showSuccessSnackBar({required String message}) {
    CommonFunc.showSnackBar(context: this, msg: message, type: SnackBarType.success);
  }

  void showErrorSnackBar({required String message}) {
    CommonFunc.showSnackBar(context: this, msg: message, type: SnackBarType.error);
  }
}
