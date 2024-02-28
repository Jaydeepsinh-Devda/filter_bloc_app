enum Category {
  fruits,
  vegetables,
  groceries,
  coldDrinks,
}

class CategoryModel {
  final String name;
  final Category category;
  bool isSelected;

  CategoryModel({
    required this.name,
    required this.category,
    this.isSelected = false,
  });
}
