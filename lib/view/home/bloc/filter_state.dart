import 'package:equatable/equatable.dart';
import 'package:filter_bloc_demo/model/category_model.dart';
import 'package:filter_bloc_demo/model/item_list_view_model.dart';
import 'package:filter_bloc_demo/model/price_list_view_model.dart';

class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object?> get props => [];
}

class FilterInitialState extends FilterState {}

class FilterLoadingState extends FilterState {}

class FilterGetListState extends FilterState {
  final List<CategoryModel> categoryList;
  final List<PriceListViewModel> priceList;
  final List<ItemListViewModel> itemList;

  const FilterGetListState(
      {required this.categoryList,
      required this.priceList,
      required this.itemList});

  @override
  List<Object?> get props =>
      [categoryList, priceList, itemList, identityHashCode(this)];
}

class CategoryListChangeState extends FilterState {
  final List<CategoryModel> list;

  const CategoryListChangeState({required this.list});

  @override
  List<Object?> get props => [list, identityHashCode(this)];
}

class PriceListChangeState extends FilterState {
  final List<PriceListViewModel> list;

  const PriceListChangeState({required this.list});

  @override
  List<Object?> get props => [list, identityHashCode(this)];
}

class ItemListChangeState extends FilterState {
  final List<ItemListViewModel> list;

  const ItemListChangeState({required this.list});

  @override
  List<Object?> get props => [list, identityHashCode(this)];
}