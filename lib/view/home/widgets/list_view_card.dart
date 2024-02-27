import 'package:flutter/material.dart';

class ListViewCard extends StatelessWidget {
  final List list;
  final VoidCallback onTap;
  final double cardHeight;
  final double cardWidth;
  final Color? color;
  final String showListProperty;

  const ListViewCard({
    required this.list,
    required this.onTap,
    required this.cardHeight,
    required this.cardWidth,
    required this.color,
    required this.showListProperty,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (ctx, index) {
          return _categoryCard(index);
        },
      ),
    );
  }

  Widget _categoryCard(int index) => SizedBox(
        width: cardWidth,
        child: GestureDetector(
          onTap: onTap,
          child: Card(
            color: color,
            child: Center(
              child: Text(showListProperty),
            ),
          ),
        ),
      );
}