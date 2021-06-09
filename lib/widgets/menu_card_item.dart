import 'package:flutter/material.dart';

import 'card_item.dart';

class MenuCardItem extends CardItem {
  final IconData icon;
  final String title;
  final Color color, titleColor, iconColor;
  final double iconSize, fontSize;
  MenuCardItem({
    this.iconColor = Colors.white,
    @required this.icon,
    @required this.title,
    this.titleColor = Colors.white,
    this.fontSize = 16,
    this.iconSize = 20,
    this.color = Colors.lightGreen,
  });

  @override
  Widget buildWidget(double diffPosition) {
    return Container(
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 6),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  this.icon,
                  size: iconSize,
                  color: iconColor,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                this.title,
                style: TextStyle(
                  color: titleColor,
                  fontSize: fontSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
