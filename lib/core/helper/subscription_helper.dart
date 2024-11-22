import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:genesia_demo/core/base/base_cubit.dart';

base mixin SubscriptionHelper on BaseCubit {
  @visibleForTesting
  @protected
  final List<StreamSubscription> subscriptions = [];

  @override
  void onDispose() {

    debugPrint("DISPOSE STREAM :: :::");

    cancelAllSubscriptions();
    super.onDispose();
  }

  @protected
  void cancelAllSubscriptions() {
    if (subscriptions.isNotEmpty) {
      for (final subscription in subscriptions) {
        subscription.cancel();
      }
    }
  }
}
