import 'package:flutter/material.dart';

import 'widgets/sliderCard.dart';

class CustomSlider extends StatefulWidget {
  final List<SliderCard> list;
  final MediaQueryData mediaQuery;
  final double height;
  CustomSlider({this.list, this.mediaQuery, this.height = 0.2});
  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  List<Widget> items = [];
  int centerIndex;
  double mainWidth = 200;
  bool flag = true;
  @override
  void initState() {
    mainWidth = double.parse(this.widget.list[0].width.toString());
    for (int i = 0; i < widget.list.length; i++) {
      if (widget.list.length % 2 == 0) {
        //Even List Alignment
        centerIndex = int.parse(((widget.list.length) / 2).toStringAsFixed(0));
        if (i == centerIndex) {
          //Center Widget
          items.add(AnimatedPositioned(
            child: widget.list[i],
            left: (widget.mediaQuery.size.width / 2) -
                widget.list[i].width * widget.mediaQuery.size.width / 2,
            duration: Duration(seconds: 3),
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
              width: calculateWidthBelowCenter(i),
            );
            items.add(AnimatedPositioned(
              child: widget.list[i],
              left: ((widget.mediaQuery.size.width / 2) -
                      widget.list[i].width * widget.mediaQuery.size.width / 2) -
                  (centerIndex - i) * widget.mediaQuery.size.width * 0.2,
              duration: Duration(seconds: 3),
            ));
            setState(() {});
          } else {
            widget.list[i] = SliderCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              width: calculateWidthAboveCenter(i),
            );
            items.insert(
                0,
                AnimatedPositioned(
                  child: widget.list[i],
                  left: ((widget.mediaQuery.size.width / 2) -
                          widget.list[i].width *
                              widget.mediaQuery.size.width /
                              2) +
                      (i - centerIndex) * widget.mediaQuery.size.width * 0.2,
                  duration: Duration(seconds: 3),
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
          items.add(AnimatedPositioned(
            child: widget.list[i],
            left: (widget.mediaQuery.size.width / 2) -
                widget.list[i].width * widget.mediaQuery.size.width / 2,
            duration: Duration(seconds: 3),
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
              width: calculateWidthBelowCenter(i),
            );
            items.add(AnimatedPositioned(
              child: Center(child: widget.list[i]),
              left: ((widget.mediaQuery.size.width / 2) -
                      widget.list[i].width * widget.mediaQuery.size.width / 2) -
                  (centerIndex - i) * widget.mediaQuery.size.width * 0.2,
              duration: Duration(seconds: 3),
            ));
            setState(() {});
          } else {
            widget.list[i] = SliderCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              width: calculateWidthAboveCenter(i),
            );
            items.insert(
                0,
                AnimatedPositioned(
                  child: widget.list[i],
                  left: ((widget.mediaQuery.size.width / 2) -
                          widget.list[i].width *
                              widget.mediaQuery.size.width /
                              2) +
                      (i - centerIndex) * widget.mediaQuery.size.width * 0.2,
                  duration: Duration(seconds: 3),
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
            width: mainWidth,
          );
          items.add(AnimatedPositioned(
            child: widget.list[i],
            left: (widget.mediaQuery.size.width / 2) -
                widget.list[i].width * widget.mediaQuery.size.width / 2,
            duration: Duration(seconds: 3),
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
              width: calculateWidthBelowCenter(i),
            );
            items.add(AnimatedPositioned(
              child: widget.list[i],
              left: ((widget.mediaQuery.size.width / 2) -
                      widget.list[i].width * widget.mediaQuery.size.width / 2) -
                  (centerIndex - i) * widget.mediaQuery.size.width * 0.2,
              duration: Duration(seconds: 3),
            ));
            setState(() {});
          } else {
            widget.list[i] = SliderCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              width: calculateWidthAboveCenter(i),
            );
            items.insert(
                0,
                AnimatedPositioned(
                  child: widget.list[i],
                  left: ((widget.mediaQuery.size.width / 2) -
                          widget.list[i].width *
                              widget.mediaQuery.size.width /
                              2) +
                      (i - centerIndex) * widget.mediaQuery.size.width * 0.2,
                  duration: Duration(seconds: 3),
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
            width: mainWidth,
          );
          items.add(AnimatedPositioned(
            child: widget.list[i],
            left: (widget.mediaQuery.size.width / 2) -
                widget.list[i].width * widget.mediaQuery.size.width / 2,
            duration: Duration(seconds: 3),
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
              width: calculateWidthBelowCenter(i),
            );
            items.add(AnimatedPositioned(
              child: Center(child: widget.list[i]),
              left: ((widget.mediaQuery.size.width / 2) -
                      widget.list[i].width * widget.mediaQuery.size.width / 2) -
                  (centerIndex - i) * widget.mediaQuery.size.width * 0.2,
              duration: Duration(seconds: 3),
            ));
            setState(() {});
          } else {
            widget.list[i] = SliderCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              width: calculateWidthAboveCenter(i),
            );
            items.insert(
                0,
                AnimatedPositioned(
                  child: widget.list[i],
                  left: ((widget.mediaQuery.size.width / 2) -
                          widget.list[i].width *
                              widget.mediaQuery.size.width /
                              2) +
                      (i - centerIndex) * widget.mediaQuery.size.width * 0.2,
                  duration: Duration(seconds: 3),
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
            width: mainWidth,
          );
          items.add(AnimatedPositioned(
            child: widget.list[i],
            left: (widget.mediaQuery.size.width / 2) -
                widget.list[i].width * widget.mediaQuery.size.width / 2,
            duration: Duration(seconds: 3),
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
              width: calculateWidthBelowCenter(i),
            );
            items.add(AnimatedPositioned(
              child: widget.list[i],
              left: ((widget.mediaQuery.size.width / 2) -
                      widget.list[i].width * widget.mediaQuery.size.width / 2) -
                  (centerIndex - i) * widget.mediaQuery.size.width * 0.2,
              duration: Duration(seconds: 3),
            ));
            setState(() {});
          } else {
            widget.list[i] = SliderCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              width: calculateWidthAboveCenter(i),
            );
            items.insert(
                0,
                AnimatedPositioned(
                  child: widget.list[i],
                  left: ((widget.mediaQuery.size.width / 2) -
                          widget.list[i].width *
                              widget.mediaQuery.size.width /
                              2) +
                      (i - centerIndex) * widget.mediaQuery.size.width * 0.2,
                  duration: Duration(seconds: 3),
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
            width: mainWidth,
          );
          items.add(AnimatedPositioned(
            child: widget.list[i],
            left: (widget.mediaQuery.size.width / 2) -
                widget.list[i].width * widget.mediaQuery.size.width / 2,
            duration: Duration(seconds: 3),
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
              width: calculateWidthBelowCenter(i),
            );
            items.add(AnimatedPositioned(
              child: Center(child: widget.list[i]),
              left: ((widget.mediaQuery.size.width / 2) -
                      widget.list[i].width * widget.mediaQuery.size.width / 2) -
                  (centerIndex - i) * widget.mediaQuery.size.width * 0.2,
              duration: Duration(seconds: 3),
            ));
            setState(() {});
          } else {
            widget.list[i] = SliderCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              width: calculateWidthAboveCenter(i),
            );
            items.insert(
                0,
                AnimatedPositioned(
                  child: widget.list[i],
                  left: ((widget.mediaQuery.size.width / 2) -
                          widget.list[i].width *
                              widget.mediaQuery.size.width /
                              2) +
                      (i - centerIndex) * widget.mediaQuery.size.width * 0.2,
                  duration: Duration(seconds: 3),
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
    var mediaQuery = MediaQuery.of(context);

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
        width: mediaQuery.size.width,
        child: Stack(
          alignment: Alignment.center,
          children: items,
        ),
      ),
    );
  }
}
