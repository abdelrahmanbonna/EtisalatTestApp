import 'package:flutter/material.dart';

import 'widgets/sliderCard.dart';

class CustomSlider extends StatefulWidget {
  final List<SliderCard> list;
  final MediaQueryData mediaQuery;
  final double heightScale, widthScale;
  final AnimationController animationController;
  CustomSlider({
    this.list,
    this.mediaQuery,
    this.heightScale = 1,
    this.widthScale = 1,
    this.animationController,
  });
  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider>
    with SingleTickerProviderStateMixin {
  List<Widget> items = [];
  List<double> paddingList = [];
  int centerIndex;
  double mainWidth = 00;
  bool flag = true;
  @override
  void initState() {
    var mediaQuery = widget.mediaQuery;
    mainWidth = double.parse(this.widget.list[0].widthScale.toString());
    for (int i = 0; i < widget.list.length; i++) {
      if (widget.list.length % 2 == 0) {
        //Even List Alignment
        centerIndex = int.parse(((widget.list.length) / 2).toStringAsFixed(0));
        if (i == centerIndex) {
          //Center Widget
          items.add(Positioned(
            child: widget.list[i],
            left: (mediaQuery.size.width / 2) -
                widget.list[i].widthScale * mediaQuery.size.width / 2,
            // duration: Duration(seconds: 3),
          ));
          setState(() {});
        } else {
          //Other Widgets
          if (i < centerIndex) {
            widget.list[i] = SliderCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              widthScale: calculateWidthBelowCenter(i),
            );
            items.add(Positioned(
              child: widget.list[i],
              left: ((mediaQuery.size.width / 2) -
                      widget.list[i].widthScale * mediaQuery.size.width / 2) -
                  (centerIndex - i) * mediaQuery.size.width * 0.2,
              // duration: Duration(seconds: 3),
            ));
            setState(() {});
          } else {
            widget.list[i] = SliderCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              widthScale: calculateWidthAboveCenter(i),
            );
            items.insert(
                0,
                Positioned(
                  child: widget.list[i],
                  left: ((mediaQuery.size.width / 2) -
                          widget.list[i].widthScale *
                              mediaQuery.size.width /
                              2) +
                      (i - centerIndex) * mediaQuery.size.width * 0.2,
                  // duration: Duration(seconds: 3),
                ));
            setState(() {});
          }
        }
      } else {
        //ODD list Alignment
        centerIndex =
            int.parse(((widget.list.length + 1) / 2).toStringAsFixed(0)) - 1;
        if (i == centerIndex) {
          //Center Widget
          items.add(Positioned(
            child: widget.list[i],
            left: (mediaQuery.size.width / 2) -
                widget.list[i].widthScale * mediaQuery.size.width / 2,
            // duration: Duration(seconds: 3),
          ));
          setState(() {});
        } else {
          //Other Widgets

          if (i < centerIndex) {
            widget.list[i] = SliderCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              widthScale: calculateWidthBelowCenter(i),
            );
            items.add(Positioned(
              child: Center(child: widget.list[i]),
              left: ((mediaQuery.size.width / 2) -
                      widget.list[i].widthScale * mediaQuery.size.width / 2) -
                  (centerIndex - i) * mediaQuery.size.width * 0.2,
              // duration: Duration(seconds: 3),
            ));
            setState(() {});
          } else {
            widget.list[i] = SliderCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              widthScale: calculateWidthAboveCenter(i),
            );
            items.insert(
                0,
                Positioned(
                  child: widget.list[i],
                  left: ((mediaQuery.size.width / 2) -
                          widget.list[i].widthScale *
                              mediaQuery.size.width /
                              2) +
                      (i - centerIndex) * mediaQuery.size.width * 0.2,
                  // duration: Duration(seconds: 3),
                ));
            setState(() {});
          }
        }
      }
    }
    super.initState();
  }

  scrollStack() {
    items = [];
    setState(() {});
    var mediaQuery = widget.mediaQuery;
    var lastItem = widget.list[widget.list.length - 1];
    for (int i = widget.list.length - 1; i > 0; i--) {
      widget.list[i] = widget.list[i - 1];
    }
    widget.list[0] = lastItem;
    for (int i = 0; i < widget.list.length; i++) {
      if (widget.list.length % 2 == 0) {
        //Even List Alignment
        if (i == centerIndex) {
          //Center Widget
          widget.list[i] = SliderCard(
            icon: widget.list[i].icon,
            color: widget.list[i].color,
            iconColor: widget.list[i].iconColor,
            textColor: widget.list[i].textColor,
            title: widget.list[i].title,
            widthScale: mainWidth,
          );
          items.add(Positioned(
            child: widget.list[i],
            left: (mediaQuery.size.width / 2) -
                widget.list[i].widthScale * mediaQuery.size.width / 2,
            // duration: Duration(seconds: 3),
          ));
          setState(() {});
        } else {
          //Other Widgets
          if (i < centerIndex) {
            widget.list[i] = SliderCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              widthScale: calculateWidthBelowCenter(i),
            );
            items.add(Positioned(
              child: widget.list[i],
              left: ((mediaQuery.size.width / 2) -
                      widget.list[i].widthScale * mediaQuery.size.width / 2) -
                  (centerIndex - i) * mediaQuery.size.width * 0.2,
              // duration: Duration(seconds: 3),
            ));
            setState(() {});
          } else {
            widget.list[i] = SliderCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              widthScale: calculateWidthAboveCenter(i),
            );
            items.insert(
                0,
                Positioned(
                  child: widget.list[i],
                  left: ((mediaQuery.size.width / 2) -
                          widget.list[i].widthScale *
                              mediaQuery.size.width /
                              2) +
                      (i - centerIndex) * mediaQuery.size.width * 0.2,
                  // duration: Duration(seconds: 3),
                ));
            setState(() {});
          }
        }
      } else {
        //ODD list Alignment
        if (i == centerIndex) {
          //Center Widget
          widget.list[i] = SliderCard(
            icon: widget.list[i].icon,
            color: widget.list[i].color,
            iconColor: widget.list[i].iconColor,
            textColor: widget.list[i].textColor,
            title: widget.list[i].title,
            widthScale: mainWidth,
          );
          items.add(Positioned(
            child: widget.list[i],
            left: (mediaQuery.size.width / 2) -
                widget.list[i].widthScale * mediaQuery.size.width / 2,
            // duration: Duration(seconds: 3),
          ));
          setState(() {});
        } else {
          //Other Widgets
          if (i < centerIndex) {
            widget.list[i] = SliderCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              widthScale: calculateWidthBelowCenter(i),
            );
            items.add(Positioned(
              child: Center(child: widget.list[i]),
              left: ((mediaQuery.size.width / 2) -
                      widget.list[i].widthScale * mediaQuery.size.width / 2) -
                  (centerIndex - i) * mediaQuery.size.width * 0.2,
              // duration: Duration(seconds: 3),
            ));
            setState(() {});
          } else {
            widget.list[i] = SliderCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              widthScale: calculateWidthAboveCenter(i),
            );
            items.insert(
                0,
                Positioned(
                  child: widget.list[i],
                  left: ((mediaQuery.size.width / 2) -
                          widget.list[i].widthScale *
                              mediaQuery.size.width /
                              2) +
                      (i - centerIndex) * mediaQuery.size.width * 0.2,
                  // duration: Duration(seconds: 3),
                ));
            setState(() {});
          }
        }
      }
    }
  }

  scrollStackReverse() {
    items = [];
    setState(() {});
    var mediaQuery = widget.mediaQuery;

    var firstItem = widget.list[0];
    for (int i = 0; i < widget.list.length - 1; i++) {
      widget.list[i] = widget.list[i + 1];
    }
    widget.list[widget.list.length - 1] = firstItem;
    for (int i = 0; i < widget.list.length; i++) {
      if (widget.list.length % 2 == 0) {
        //Even List Alignment
        if (i == centerIndex) {
          //Center Widget
          widget.list[i] = SliderCard(
            icon: widget.list[i].icon,
            color: widget.list[i].color,
            iconColor: widget.list[i].iconColor,
            textColor: widget.list[i].textColor,
            title: widget.list[i].title,
            widthScale: mainWidth,
          );
          items.add(Positioned(
            child: widget.list[i],
            left: (mediaQuery.size.width / 2) -
                widget.list[i].widthScale * mediaQuery.size.width / 2,
            // duration: Duration(seconds: 3),
          ));
          setState(() {});
        } else {
          //Other Widgets
          if (i < centerIndex) {
            widget.list[i] = SliderCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              widthScale: calculateWidthBelowCenter(i),
            );
            items.add(Positioned(
              child: widget.list[i],
              left: ((mediaQuery.size.width / 2) -
                      widget.list[i].widthScale * mediaQuery.size.width / 2) -
                  (centerIndex - i) * mediaQuery.size.width * 0.2,
              // duration: Duration(seconds: 3),
            ));
            setState(() {});
          } else {
            widget.list[i] = SliderCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              widthScale: calculateWidthAboveCenter(i),
            );
            items.insert(
                0,
                Positioned(
                  child: widget.list[i],
                  left: ((mediaQuery.size.width / 2) -
                          widget.list[i].widthScale *
                              mediaQuery.size.width /
                              2) +
                      (i - centerIndex) * mediaQuery.size.width * 0.2,
                  // duration: Duration(seconds: 3),
                ));
            setState(() {});
          }
        }
      } else {
        //ODD list Alignment
        if (i == centerIndex) {
          //Center Widget
          widget.list[i] = SliderCard(
            icon: widget.list[i].icon,
            color: widget.list[i].color,
            iconColor: widget.list[i].iconColor,
            textColor: widget.list[i].textColor,
            title: widget.list[i].title,
            widthScale: mainWidth,
          );
          items.add(Positioned(
            child: widget.list[i],
            left: (mediaQuery.size.width / 2) -
                widget.list[i].widthScale * mediaQuery.size.width / 2,
            // duration: Duration(seconds: 3),
          ));
          setState(() {});
        } else {
          //Other Widgets
          if (i < centerIndex) {
            widget.list[i] = SliderCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              widthScale: calculateWidthBelowCenter(i),
            );
            items.add(Positioned(
              child: Center(child: widget.list[i]),
              left: ((mediaQuery.size.width / 2) -
                      widget.list[i].widthScale * mediaQuery.size.width / 2) -
                  (centerIndex - i) * mediaQuery.size.width * 0.2,
              // duration: Duration(seconds: 3),
            ));
            setState(() {});
          } else {
            widget.list[i] = SliderCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              widthScale: calculateWidthAboveCenter(i),
            );
            items.insert(
                0,
                Positioned(
                  child: widget.list[i],
                  left: ((mediaQuery.size.width / 2) -
                          widget.list[i].widthScale *
                              mediaQuery.size.width /
                              2) +
                      (i - centerIndex) * mediaQuery.size.width * 0.2,
                  // duration: Duration(seconds: 3),
                ));
            setState(() {});
          }
        }
      }
    }
  }

  double calculateWidthBelowCenter(index) {
    if (index == centerIndex) {
      return mainWidth;
    } else {
      return calculateWidthBelowCenter(index + 1) * 0.8;
    }
  }

  double calculateWidthAboveCenter(index) {
    if (index == centerIndex) {
      return mainWidth;
    } else {
      return calculateWidthAboveCenter(index - 1) * 0.8;
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = widget.mediaQuery;

    return GestureDetector(
      onHorizontalDragEnd: (d) {
        print('vel: ${d.primaryVelocity}');
        if (d.primaryVelocity < 0) {
          scrollStackReverse();
        } else if (d.primaryVelocity > 0) {
          scrollStack();
        }
      },
      onHorizontalDragUpdate: (d) {
        print('${d.globalPosition.dx}');
      },
      child: Container(
        width: mediaQuery.size.width * this.widget.widthScale,
        height: mediaQuery.size.height * this.widget.heightScale,
        child: Stack(
          alignment: Alignment.center,
          children: items,
        ),
      ),
    );
  }
}
