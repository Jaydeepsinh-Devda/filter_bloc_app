class PriceListViewModel {
  String price;
  num min;
  num max;
  bool isSelected;

  PriceListViewModel({
    required this.price,
    required this.min,
    required this.max,
    this.isSelected = false
  });
}
