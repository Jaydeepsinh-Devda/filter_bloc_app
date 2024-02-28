import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:filter_bloc_demo/data/category_data.dart';
import 'package:filter_bloc_demo/data/item_list_data.dart';
import 'package:filter_bloc_demo/data/price_list_data.dart';
import 'package:filter_bloc_demo/model/category_model.dart';
import 'package:filter_bloc_demo/model/item_model.dart';
import 'package:filter_bloc_demo/model/price_model.dart';
import 'package:filter_bloc_demo/view/home/bloc/filter_event.dart';
import 'package:filter_bloc_demo/view/home/bloc/filter_state.dart';

class HomeBloc extends Bloc<FilterEvent, HomeState> {
  List<ItemModel> _itemList = [];
  List<CategoryModel> _categoryList = [];
  List<PriceModel> _priceList = [];
  int _priceIndex = 0;

  HomeBloc() : super(HomeFilterListInitialState()) {
    on<GetListEvent>(_getList);
    on<SelectCategoryEvent>(_onCategorySelect);
    on<SelectPriceEvent>(_onPriceSelect);
    on<ItemLikeUnlikeEvent>(_likeButtonClicked);
    on<FilterItemListEvent>(_filterItem);
  }

  FutureOr<void> _filterItem(
      FilterItemListEvent event, Emitter<HomeState> emit) async {
    emit(HomeFilterListLoadingState());

    await Future.delayed(
      const Duration(seconds: 3),
    );

    var selectedCategoryList = _categoryList
        .where((element) => element.isSelected)
        .map((e) => e.category)
        .toList();
    var selectedPriceRange = _priceList[_priceIndex];

    _itemList =
        _getFilterItems(selectedCategoryList, selectedPriceRange, itemListData);

    emit(OnItemListChangeState(list: _itemList));
  }

  void _getList(GetListEvent event, Emitter<HomeState> emit) {
    _categoryList = categoryData;
    _itemList = itemListData;
    _priceList = priceListData;
    emit(OnFilterGetListState(
        categoryList: _categoryList,
        priceList: _priceList,
        itemList: _itemList));
  }

  List<ItemModel> _getFilterItems(List<Category> selectedCategories,
      PriceModel range, List<ItemModel> allItems) {
    return allItems.where((e) {
      return e.price >= range.min &&
          e.price <= range.max &&
          (selectedCategories.isEmpty ||
              selectedCategories.contains(e.category));
    }).toList();
  }

  FutureOr<void> _onCategorySelect(
      SelectCategoryEvent event, Emitter<HomeState> emit) async {
    _categoryList[event.index].isSelected =
        !_categoryList[event.index].isSelected;

    emit(OnCategoryListChangeState(list: _categoryList));
  }

  FutureOr<void> _onPriceSelect(
      SelectPriceEvent event, Emitter<HomeState> emit) {
    _priceIndex = event.index;

    _itemList = _itemList
        .where((e) =>
            e.price >= _priceList[event.index].min &&
            e.price <= _priceList[event.index].max)
        .toList();

    emit(OnPriceListChangeState(list: _priceList, index: _priceIndex));
  }

  FutureOr<void> _likeButtonClicked(
      ItemLikeUnlikeEvent event, Emitter<HomeState> emit) {
    _itemList[event.index].isFavorite = !_itemList[event.index].isFavorite;
    
    emit(OnItemListChangeState(list: _itemList));
  }
}
