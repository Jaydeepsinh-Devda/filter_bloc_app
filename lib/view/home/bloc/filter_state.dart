import 'package:equatable/equatable.dart';
import 'package:filter_bloc_demo/model/category_model.dart';
import 'package:filter_bloc_demo/model/item_model.dart';
import 'package:filter_bloc_demo/model/price_model.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeFilterListInitialState extends HomeState {}

class HomeFilterListLoadingState extends HomeState {}

class OnFilterGetListState extends HomeState {
  final List<CategoryModel> categoryList;
  final List<PriceModel> priceList;
  final List<ItemModel> itemList;

  const OnFilterGetListState(
      {required this.categoryList,
      required this.priceList,
      required this.itemList});

  @override
  List<Object?> get props =>
      [categoryList, priceList, itemList, identityHashCode(this)];
}

class OnCategoryListChangeState extends HomeState {
  final List<CategoryModel> list;

  const OnCategoryListChangeState({required this.list});

  @override
  List<Object?> get props => [list, identityHashCode(this)];
}

class OnPriceListChangeState extends HomeState {
  final List<PriceModel> list;
  final int index;

  const OnPriceListChangeState({required this.list, required this.index});

  @override
  List<Object?> get props => [list, index, identityHashCode(this)];
}

class OnItemListChangeState extends HomeState {
  final List<ItemModel> list;

  const OnItemListChangeState({required this.list});

  @override
  List<Object?> get props => [list, identityHashCode(this)];
}
