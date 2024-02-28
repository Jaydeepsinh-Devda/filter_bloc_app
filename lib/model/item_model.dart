import 'package:filter_bloc_demo/model/category_model.dart';

class ItemModel {
  final String name;
  final int price;
  final Category category;
  bool isFavorite;

  ItemModel({
    required this.name,
    required this.category,
    required this.price,
    this.isFavorite = false,
  });
}

// class ItemsModel {
//   List<CategoryModel> selectedCategories;
//   List<ItemListViewModel> allItems;
// }