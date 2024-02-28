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
  int index = 0;

  FilterBloc() : super(FilterInitialState()) {
    on<GetListEvent>(_getList);
    on<CategoryListSelectEvent>(_onCategorySelect);
    on<PriceListSelectEvent>(_onPriceSelect);
    on<ItemLikedEvent>(_likeButtonClicked);
    on<FilterItemEvent>(_filterItem);
  }

  FutureOr<void> _filterItem(
      FilterItemEvent event, Emitter<FilterState> emit) async {
    var selectedCategoryList = _categoryList
        .where((element) => element.isSelected)
        .map((e) => e.category)
        .toList();
    var selectedPriceRange = _priceList[index];

    _itemList = _getFilterItems(
        selectedCategoryList, selectedPriceRange, itemListViewData);

    emit(FilterLoadingState());

    await Future.delayed(
      const Duration(seconds: 3),
    );

    emit(ItemListChangeState(list: _itemList));
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

  List<ItemListViewModel> _getFilterItems(List<Category> selectedCategories,
      PriceListViewModel range, List<ItemListViewModel> allItems) {
    return allItems.where((e) {
      return e.price >= range.min &&
          e.price <= range.max &&
          (selectedCategories.isEmpty ||
              selectedCategories.contains(e.category));
    }).toList();
  }

  FutureOr<void> _onCategorySelect(
      CategoryListSelectEvent event, Emitter<FilterState> emit) async {
    _categoryList[event.index].isSelected =
        !_categoryList[event.index].isSelected;

    emit(CategoryListChangeState(list: _categoryList));
  }

  FutureOr<void> _onPriceSelect(
      PriceListSelectEvent event, Emitter<FilterState> emit) async {
    index = event.index;

    _itemList = _itemList
        .where((e) =>
            e.price >= _priceList[event.index].min &&
            e.price <= _priceList[event.index].max)
        .toList();

    emit(PriceListChangeState(list: _priceList));
  }

  void _likeButtonClicked(ItemLikedEvent event, Emitter<FilterState> emit) {
    _itemList[event.index].isFavorite = !_itemList[event.index].isFavorite;
    emit(ItemListChangeState(list: _itemList));
  }
}
