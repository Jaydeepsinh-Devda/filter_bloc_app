import 'package:filter_bloc_demo/model/category_model.dart';
import 'package:filter_bloc_demo/model/item_list_view_model.dart';

List<ItemListViewModel> itemListViewData = [
  ItemListViewModel(
    name: "Apple",
    category: Category.fruits,
    price: 500,
  ),
  ItemListViewModel(
    name: "Banana",
    category: Category.fruits,
    price: 100,
  ),
  ItemListViewModel(
    name: "Carrot",
    category: Category.vegetables,
    price: 200,
  ),
  ItemListViewModel(
    name: "Broccoli",
    category: Category.vegetables,
    price: 800,
  ),
  ItemListViewModel(
    name: "Rice",
    category: Category.groceries,
    price: 1000,
  ),
  ItemListViewModel(
    name: "Pasta",
    category: Category.groceries,
    price: 1000,
  ),
  ItemListViewModel(
    name: "Coca-Cola",
    category: Category.coldDrinks,
    price: 400,
  ),
  ItemListViewModel(
    name: "Pepsi",
    category: Category.coldDrinks,
    price: 350,
  ),
  ItemListViewModel(
    name: "Milk",
    category: Category.groceries,
    price: 600,
  ),
  ItemListViewModel(
    name: "Orange Juice",
    category: Category.coldDrinks,
    price: 90,
  ),
];
