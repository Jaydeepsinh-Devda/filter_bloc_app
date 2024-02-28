import 'package:equatable/equatable.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object?> get props => [];
}

class GetListEvent extends FilterEvent {}

class SelectCategoryEvent extends FilterEvent {
  final int index;

  const SelectCategoryEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class SelectPriceEvent extends FilterEvent {
  final int index;

  const SelectPriceEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class ItemLikeUnlikeEvent extends FilterEvent {
  final int index;

  const ItemLikeUnlikeEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class FilterItemListEvent extends FilterEvent {}
