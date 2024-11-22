abstract class PaginationHelper<T extends Object?> {
  Future<void> onRefresh();

  Future<void> onLoadMore();

  List<T> get list;

  int? get lastPage;

  bool get isLoading;
}

class PaginatedList<T extends Object?, D extends Object?> {
  bool isAvailableMore;
  List<T> list;
  int? lastPage;
  D? data;


  PaginatedList(
      {required this.isAvailableMore,
      required this.list,
      required this.lastPage, this.data});

  PaginatedList.empty(
      {this.list = const [], this.isAvailableMore = false, this.lastPage,this.data});
}
