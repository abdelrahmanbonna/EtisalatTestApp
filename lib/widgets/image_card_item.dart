import 'package:flutter/material.dart';

import 'card_item.dart';

class ImageCarditem extends CardItem {
  final Widget image;

  ImageCarditem({this.image});

  @override
  Widget buildWidget(double diffPosition) {
    return image;
  }
}
