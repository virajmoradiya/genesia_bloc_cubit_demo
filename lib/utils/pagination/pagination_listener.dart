import 'package:flutter/material.dart';

typedef OnNotificationReFresh = Future Function();
typedef OnLoadMore = Future Function();

class PaginationListener extends StatelessWidget {
  final Widget child;
  final OnNotificationReFresh onRefresh;
  final OnLoadMore onLoadMore;

  const PaginationListener(
      {super.key,
      required this.child,
      required this.onRefresh,
      required this.onLoadMore});

  @override
  Widget build(BuildContext context) {
    Widget child = NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if(notification.metrics.maxScrollExtent== notification.metrics.pixels){
          onLoadMore();
        }
        return true;
      },
        child:
            RefreshIndicator.adaptive(onRefresh: onRefresh, child: this.child));
    return child;
  }
}
