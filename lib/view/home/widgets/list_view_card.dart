import 'package:flutter/material.dart';

class ListViewCard extends StatelessWidget {
  final VoidCallback onTap;
  final double cardWidth;
  final Color? color;
  final String showListProperty;

  const ListViewCard({
    required this.onTap,
    required this.cardWidth,
    required this.color,
    required this.showListProperty,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
}
