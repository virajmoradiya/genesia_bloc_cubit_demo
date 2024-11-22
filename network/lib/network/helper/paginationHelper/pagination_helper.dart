part of '../../../network.dart';
abstract class PaginationHelper<T extends Object?> {
  Future<void> onRefresh();

  Future<void> onLoadMore();

  List<T> get list;

  int get currentPage;

  bool get isLoading;
  bool get isAvailableMore;
}

class PaginatedList<T extends Object?> {
  bool isAvailableMore;
  List<T> list;

  PaginatedList({required this.list, required this.isAvailableMore});

  PaginatedList.empty({this.list = const [], this.isAvailableMore = false});
}