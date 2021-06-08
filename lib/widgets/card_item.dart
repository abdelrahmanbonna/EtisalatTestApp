import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class CardItem {
  double height;
  Widget buildWidget(double diffPosition);
}
