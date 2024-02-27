import 'package:filter_bloc_demo/model/category_model.dart';

class ItemListViewModel {
  String name;
  int price;
  Category category;
  bool isFavorite;


  ItemListViewModel({
    required this.name,
    required this.category,
    required this.price,
    this.isFavorite = false
  });
}