import 'package:filter_bloc_demo/data/item_list_view_data.dart';
import 'package:filter_bloc_demo/view/home/bloc/filter_state.dart';
import 'package:flutter/material.dart';

class ItemListView extends StatefulWidget {
  final BuildContext context;
  final FilterState state;
  const ItemListView(
    this.context,
    this.state, {
    super.key,
  });

  @override
  State<ItemListView> createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  //! Build Method
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: itemListViewData.length,
      itemBuilder: (ctx, index) {
        return _itemListTile(index);
      },
    );
  }

//! Widget Method
  Widget _itemListTile(int index) => Card(
        child: ListTile(
          leading: IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          title: Text(itemListViewData[index].name),
          subtitle: Text(itemListViewData[index].category.name.toUpperCase()),
          trailing: Text(
            "Rs. ${itemListViewData[index].price}",
            style: const TextStyle(color: Colors.black),
          ),
        ),
      );
}
