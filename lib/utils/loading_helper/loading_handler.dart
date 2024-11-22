import 'package:flutter/material.dart';
import 'package:genesia_demo/extensions/build_context_ext.dart';

part 'loading_indicator.dart';
DialogRoute? _loaderRoute;


abstract class _DialogHandler {
  void startLoading();

  void stopLoading();


  void handleDialog(bool isLoading);
}

class LoadingDialogHandler implements _DialogHandler {
  LoadingDialogHandler({required this.context});

  final BuildContext context;


  @override
  void startLoading() {
    LoadingIndicator.show(context: context, );
  }

  @override
  void stopLoading() {
    if (_loaderRoute?.isActive ?? false) {
      context.navigator.removeRoute(_loaderRoute!);
    }
  }


  @override
  void handleDialog(bool isLoading) {
    if (isLoading) {
      startLoading();
    } else {
      stopLoading();
    }
  }
}
