import 'package:flutter/material.dart';

import 'widgets/sliderCard.dart';

class CustomSlider extends StatefulWidget {
  final List<SliderCard> list;
  final MediaQueryData mediaQuery;
  final double heightScale, widthScale;
  // final AnimationController animationController;
  CustomSlider({
    this.list,
    this.mediaQuery,
    this.heightScale = 1,
    this.widthScale = 1,
    // this.animationController,
  });
  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  List<Widget> items = [];
  List<double> paddingList = [];
  int centerIndex;
  double mainWidth = 00;
  bool flag = true;
  @override
  void initState() {
    mainWidth = double.parse(this.widget.list[0].widthScale.toString());
    for (int i = 0; i < widget.list.length; i++) {
      if (widget.list.length % 2 == 0) {
        //Even List Alignment
        centerIndex = int.parse(((widget.list.length) / 2).toStringAsFixed(0));
        if (i == centerIndex) {
          paddingList.insert(
              i,
              (widget.mediaQuery.size.width / 2) -
                  widget.list[i].widthScale * widget.mediaQuery.size.width / 2);
          //Center Widget
          items.add(AnimatedPositioned(
            child: widget.list[i],
            left: paddingList[i],
            duration: Duration(seconds: 5),
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
            paddingList.insert(
                i,
                ((widget.mediaQuery.size.width / 2) -
                        widget.list[i].widthScale *
                            widget.mediaQuery.size.width /
                            2) -
                    (centerIndex - i) * widget.mediaQuery.size.width * 0.2);
            items.add(AnimatedPositioned(
              child: widget.list[i],
              left: paddingList[i],
              duration: Duration(seconds: 5),
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
            paddingList.insert(
                i,
                ((widget.mediaQuery.size.width / 2) -
                        widget.list[i].widthScale *
                            widget.mediaQuery.size.width /
                            2) +
                    (i - centerIndex) * widget.mediaQuery.size.width * 0.2);
            items.insert(
                0,
                AnimatedPositioned(
                  child: widget.list[i],
                  left: paddingList[i],
                  duration: Duration(seconds: 5),
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
          paddingList.insert(
              i,
              (widget.mediaQuery.size.width / 2) -
                  widget.list[i].widthScale * widget.mediaQuery.size.width / 2);
          items.add(AnimatedPositioned(
            child: widget.list[i],
            left: paddingList[i],
            duration: Duration(seconds: 5),
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
            paddingList.insert(
                i,
                ((widget.mediaQuery.size.width / 2) -
                        widget.list[i].widthScale *
                            widget.mediaQuery.size.width /
                            2) -
                    (centerIndex - i) * widget.mediaQuery.size.width * 0.2);
            items.add(AnimatedPositioned(
              child: Center(child: widget.list[i]),
              left: paddingList[i],
              duration: Duration(seconds: 5),
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
            paddingList.insert(
                i,
                ((widget.mediaQuery.size.width / 2) -
                        widget.list[i].widthScale *
                            widget.mediaQuery.size.width /
                            2) +
                    (i - centerIndex) * widget.mediaQuery.size.width * 0.2);
            items.insert(
                0,
                AnimatedPositioned(
                  child: widget.list[i],
                  left: paddingList[i],
                  duration: Duration(seconds: 5),
                ));
            setState(() {});
          }
        }
      }
    }
    super.initState();
  }

  //Functions

  //Scrolling in the direction to center
  scrollStack() {
    items = [];
    setState(() {});
    var lastItem = widget.list[widget.list.length - 1];
    var lastPadding = paddingList[widget.list.length - 1];
    for (int i = widget.list.length - 1; i > 0; i--) {
      widget.list[i] = widget.list[i - 1];
      paddingList[i] = paddingList[i - 1];
    }
    widget.list[0] = lastItem;
    paddingList[0] = lastPadding;
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
          items.add(AnimatedPositioned(
            child: widget.list[i],
            left: paddingList[i],
            duration: Duration(seconds: 5),
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
            items.add(AnimatedPositioned(
              child: widget.list[i],
              left: paddingList[i],
              duration: Duration(seconds: 5),
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
                AnimatedPositioned(
                  child: widget.list[i],
                  left: paddingList[i],
                  duration: Duration(seconds: 5),
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
          items.add(AnimatedPositioned(
            child: widget.list[i],
            left: paddingList[i],
            duration: Duration(seconds: 5),
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
            items.add(AnimatedPositioned(
              child: Center(child: widget.list[i]),
              left: paddingList[i],
              duration: Duration(seconds: 5),
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
                AnimatedPositioned(
                  child: widget.list[i],
                  left: paddingList[i],
                  duration: Duration(seconds: 5),
                ));
            setState(() {});
          }
        }
      }
    }
  }

  //Scrolling in the direction from the center to the last item
  scrollStackReverse() {
    items = [];
    setState(() {});
    var firstItem = widget.list[0];
    var firstPadding = paddingList[0];
    for (int i = 0; i < widget.list.length - 1; i++) {
      widget.list[i] = widget.list[i + 1];
      paddingList[i] = paddingList[i + 1];
    }
    widget.list[widget.list.length - 1] = firstItem;
    paddingList[widget.list.length - 1] = firstPadding;
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
          items.add(AnimatedPositioned(
            child: widget.list[i],
            left: paddingList[i],
            duration: Duration(seconds: 5),
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
            items.add(AnimatedPositioned(
              child: widget.list[i],
              left: paddingList[i],
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
              widthScale: calculateWidthAboveCenter(i),
            );
            items.insert(
                0,
                AnimatedPositioned(
                  child: widget.list[i],
                  left: paddingList[i],
                  duration: Duration(seconds: 5),
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
          items.add(AnimatedPositioned(
            child: widget.list[i],
            left: paddingList[i],
            duration: Duration(seconds: 5),
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
            items.add(AnimatedPositioned(
              child: Center(child: widget.list[i]),
              left: paddingList[i],
              duration: Duration(seconds: 5),
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
                AnimatedPositioned(
                  child: widget.list[i],
                  left: paddingList[i],
                  duration: Duration(seconds: 5),
                ));
            setState(() {});
          }
        }
      }
    }
  }

  //Calculating Width of cards from first item to center
  double calculateWidthBelowCenter(index) {
    if (index == centerIndex) {
      return mainWidth;
    } else {
      return calculateWidthBelowCenter(index + 1) * 0.8;
    }
  }

  //Calculating Width of cards from center to last item
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
        if (d.velocity.pixelsPerSecond.dx > 0) {
          scrollStack();
        } else if (d.velocity.pixelsPerSecond.dx < 0) {
          scrollStackReverse();
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
