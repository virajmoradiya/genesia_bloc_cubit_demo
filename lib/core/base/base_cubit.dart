import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genesia_demo/extensions/extensions.dart';
import 'package:genesia_demo/services/preferenceService/pref_manager.dart';
import 'package:network/network.dart';

abstract class BaseCubit<S extends Object?> extends Cubit<S> {
  final BuildContext context;

  BaseCubit(this.context, super.initialState) {
    Timer.run(onCreate);
  }

  final PrefService prefService = PrefService.instance;

  @protected
  @mustCallSuper
  void onCreate() {}

  @protected
  @mustCallSuper
  void onDispose() {}

  @override
  Future<void> close() {
    onDispose();
    return super.close();
  }

  Future<M> processApi<M>({
    required Future<M> Function() process,
    required Function(bool isLoading) loadingHandler,
    Function(Object? error)? catchError,
    bool throwError = false,
  }) async {
    loadingHandler.call(true);
    dynamic result;
    if (throwError) {
      result = await process.call();
    } else {
      result = await process.call().onError((error, stackTrace) {
        if (catchError != null) {
          return catchError(error);
        } else {
          return _handleError(error: error);
        }
      });
    }
    loadingHandler.call(false);
    return result;
  }

  _handleError({Object? error}) {
    debugPrint("error===>${error.toString()}");
    switch (error) {
      case UnAuthenticated():
        // navigatorKey.currentState?.pushNamedAndRemoveUntil(SignInScreenUI.routeName, (route) => false);
        prefService.clear();
        context.showErrorSnackBar(message: error.message ?? "Something went wrong!");
        break;
      case TimeoutException():
        context.showErrorSnackBar(message: "Timeout");
        break;
      case SocketException():
        context.showErrorSnackBar(message: error.message);
        break;
      case DefaultException():
        context.showErrorSnackBar(message: error.message ?? "Something went wrong!");
        break;
      default:
        context.showErrorSnackBar(message: "Something went wrong!");
        break;
    }
  }
}
