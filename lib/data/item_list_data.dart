import 'package:filter_bloc_demo/model/category_model.dart';
import 'package:filter_bloc_demo/model/item_model.dart';

List<ItemModel> itemListData = [
  ItemModel(
    name: "Apple",
    category: Category.fruits,
    price: 500,
  ),
  ItemModel(
    name: "Banana",
    category: Category.fruits,
    price: 100,
  ),
  ItemModel(
    name: "Carrot",
    category: Category.vegetables,
    price: 200,
  ),
  ItemModel(
    name: "Broccoli",
    category: Category.vegetables,
    price: 800,
  ),
  ItemModel(
    name: "Rice",
    category: Category.groceries,
    price: 1000,
  ),
  ItemModel(
    name: "Pasta",
    category: Category.groceries,
    price: 1000,
  ),
  ItemModel(
    name: "Coca-Cola",
    category: Category.coldDrinks,
    price: 400,
  ),
  ItemModel(
    name: "Pepsi",
    category: Category.coldDrinks,
    price: 350,
  ),
  ItemModel(
    name: "Milk",
    category: Category.groceries,
    price: 600,
  ),
  ItemModel(
    name: "Orange Juice",
    category: Category.coldDrinks,
    price: 90,
  ),
];
