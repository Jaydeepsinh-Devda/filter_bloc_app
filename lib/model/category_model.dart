enum Category {
  fruits,
  vegetables,
  groceries,
  coldDrinks,
}

class CategoryModel {
  String name;
  Category category;
  bool isSelected;

  CategoryModel({
    required this.name,
    required this.category,
    this.isSelected = false,
  });
}