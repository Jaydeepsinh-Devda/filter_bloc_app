import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:filter_bloc_demo/data/category_data.dart';
import 'package:filter_bloc_demo/data/item_list_view_data.dart';
import 'package:filter_bloc_demo/data/price_list_view_data.dart';
import 'package:filter_bloc_demo/model/category_model.dart';
import 'package:filter_bloc_demo/model/item_list_view_model.dart';
import 'package:filter_bloc_demo/model/price_list_view_model.dart';
import 'package:filter_bloc_demo/view/home/bloc/filter_event.dart';
import 'package:filter_bloc_demo/view/home/bloc/filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  List<ItemListViewModel> _itemList = [];
  List<CategoryModel> _categoryList = [];
  List<PriceListViewModel> _priceList = [];

  FilterBloc() : super(FilterInitialState()) {
    on<GetListEvent>(_getList);
    on<CategoryListSelectEvent>(_onCategorySelect);
    on<PriceListSelectEvent>(_onPriceSelect);
    on<ItemLikedEvent>(_likeButtonClicked);
  }

  void _getList(GetListEvent event, Emitter<FilterState> emit) {
    _categoryList = categoryData;
    _itemList = itemListViewData;
    _priceList = priceListViewData;
    emit(FilterGetListState(
        categoryList: _categoryList,
        priceList: _priceList,
        itemList: _itemList));
  }

  FutureOr<void> _onCategorySelect(
      CategoryListSelectEvent event, Emitter<FilterState> emit) async {
    _categoryList[event.index].isSelected =
        !_categoryList[event.index].isSelected;

    _itemList = itemListViewData
        .where((e) => _categoryList.any(
            (element) => element.isSelected && element.category == e.category))
        .toList();

    if (_itemList.isEmpty) {
      _itemList = itemListViewData;
    }

    emit(CategoryListChangeState(list: _categoryList));

    emit(FilterLoadingState());

    await Future.delayed(
      const Duration(seconds: 3),
    );

    emit(ItemListChangeState(list: _itemList));
  }

  FutureOr<void> _onPriceSelect(
      PriceListSelectEvent event, Emitter<FilterState> emit) async {
    _itemList = _itemList
        .where((e) =>
            e.price >= _priceList[event.index].min &&
            e.price <= _priceList[event.index].max)
        .toList();

    emit(PriceListChangeState(list: _priceList));

    emit(FilterLoadingState());

    await Future.delayed(const Duration(seconds: 3));

    emit(ItemListChangeState(list: _itemList));
  }

  void _likeButtonClicked(ItemLikedEvent event, Emitter<FilterState> emit) {
    _itemList[event.index].isFavorite = !_itemList[event.index].isFavorite;
    emit(ItemListChangeState(list: _itemList));
  }
}
