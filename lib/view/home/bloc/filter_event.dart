import 'package:equatable/equatable.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object?> get props => [];
}

class GetListEvent extends FilterEvent {}

class CategoryListSelectEvent extends FilterEvent {
  final int index;

  const CategoryListSelectEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class PriceListSelectEvent extends FilterEvent {
  final int index;

  const PriceListSelectEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class ItemLikedEvent extends FilterEvent {
  final int index;

  const ItemLikedEvent({required this.index});

  @override
  List<Object?> get props => [index];
}
