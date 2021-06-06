import 'package:flutter/material.dart';

import 'widgets/dragAbleCard.dart';

class CustomSlider extends StatefulWidget {
  final List<DraggableCard> list;

  final double heightScale, widthScale;
  final AnimationController animationController;
  CustomSlider({
    @required this.list,
    this.heightScale = 1,
    this.widthScale = 1,
    @required this.animationController,
  });
  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  List<Widget> items = [];
  List<double> paddingList = [];
  int centerIndex;
  double mainWidth = 00;
  Offset pointer = Offset(0.0, 0.0);
  bool flag = true;

  @override
  void initState() {
    mainWidth = this.widget.list[0].height;
    for (int i = 0; i < widget.list.length; i++) {
      if (widget.list.length % 2 == 0) {
        //Even List Alignment
        centerIndex = int.parse(((widget.list.length) / 2).toStringAsFixed(0));
        var leftOffsetSpace = 1.0 / centerIndex;
        var rightOffsetSpace = 1.0 / (widget.list.length - centerIndex);
        if (i == centerIndex) {
          //Center Widget
          widget.list[i] = DraggableCard(
            icon: widget.list[i].icon,
            color: widget.list[i].color,
            iconColor: widget.list[i].iconColor,
            textColor: widget.list[i].textColor,
            title: widget.list[i].title,
            animationController: this.widget.animationController,
            height: calculateWidthBelowCenter(i),
            fontSize: widget.list[i].fontSize,
            offset: Offset(0.0, 0.0),
          );
          items.add(widget.list[i]);
          setState(() {});
        } else {
          //Other Widgets
          if (i < centerIndex) {
            widget.list[i] = DraggableCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              animationController: this.widget.animationController,
              height: calculateWidthBelowCenter(i),
              fontSize: widget.list[i].fontSize,
              offset: Offset(
                  i == 0 ? -1.0 : (centerIndex - i) * -leftOffsetSpace, 0.0),
            );
            items.add(widget.list[i]);
            setState(() {});
          } else {
            widget.list[i] = DraggableCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              animationController: this.widget.animationController,
              height: calculateWidthAboveCenter(i),
              fontSize: widget.list[i].fontSize,
              offset: Offset(
                  i == widget.list.length - 1
                      ? 1.0
                      : ((widget.list.length - centerIndex) -
                                      (i - centerIndex)) *
                                  rightOffsetSpace >
                              0
                          ? ((widget.list.length - centerIndex) -
                                  (i - centerIndex)) *
                              rightOffsetSpace
                          : -1 *
                              (((widget.list.length - centerIndex) -
                                      (i - centerIndex)) *
                                  rightOffsetSpace),
                  0.0),
            );
            items.insert(0, widget.list[i]);
            setState(() {});
          }
        }
      } else {
        //ODD list Alignment
        centerIndex =
            int.parse(((widget.list.length + 1) / 2).toStringAsFixed(0)) - 1;
        var leftOffsetSpace = -1.0 / centerIndex;
        var rightOffsetSpace = 1.0 / (widget.list.length - centerIndex);
        if (i == centerIndex) {
          //Center Widget
          widget.list[i] = DraggableCard(
            icon: widget.list[i].icon,
            color: widget.list[i].color,
            iconColor: widget.list[i].iconColor,
            textColor: widget.list[i].textColor,
            title: widget.list[i].title,
            animationController: this.widget.animationController,
            height: calculateWidthBelowCenter(i),
            fontSize: widget.list[i].fontSize,
            offset: Offset(0.0, 0.0),
          );
          items.add(widget.list[i]);
          setState(() {});
        } else {
          //Other Widgets

          if (i < centerIndex) {
            widget.list[i] = DraggableCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              animationController: this.widget.animationController,
              height: calculateWidthBelowCenter(i),
              fontSize: widget.list[i].fontSize,
              offset: Offset(
                  i == 0 ? -1.0 : (centerIndex - i) * -leftOffsetSpace, 0.0),
            );
            items.add(Center(child: widget.list[i]));
            setState(() {});
          } else {
            widget.list[i] = DraggableCard(
              icon: widget.list[i].icon,
              color: widget.list[i].color,
              iconColor: widget.list[i].iconColor,
              textColor: widget.list[i].textColor,
              title: widget.list[i].title,
              animationController: this.widget.animationController,
              height: calculateWidthAboveCenter(i),
              fontSize: widget.list[i].fontSize,
              offset: Offset(
                  i == widget.list.length - 1
                      ? 1.0
                      : ((widget.list.length - centerIndex) -
                                      (i - centerIndex)) *
                                  rightOffsetSpace >
                              0
                          ? ((widget.list.length - centerIndex) -
                                  (i - centerIndex)) *
                              rightOffsetSpace
                          : -1 *
                              (((widget.list.length - centerIndex) -
                                      (i - centerIndex)) *
                                  rightOffsetSpace),
                  0.0),
            );
            items.insert(0, widget.list[i]);
            setState(() {});
          }
        }
      }
    }

    super.initState();
  }

  // scrollStack() {
  //   items = [];
  //   setState(() {});
  //   var mediaQuery = widget.mediaQuery;
  //   var lastItem = widget.list[widget.list.length - 1];
  //   for (int i = widget.list.length - 1; i > 0; i--) {
  //     widget.list[i] = widget.list[i - 1];
  //   }
  //   widget.list[0] = lastItem;
  //   for (int i = 0; i < widget.list.length; i++) {
  //     if (widget.list.length % 2 == 0) {
  //       //Even List Alignment
  //       if (i == centerIndex) {
  //         //Center Widget
  //         widget.list[i] = SliderCard(
  //           icon: widget.list[i].icon,
  //           color: widget.list[i].color,
  //           iconColor: widget.list[i].iconColor,
  //           textColor: widget.list[i].textColor,
  //           title: widget.list[i].title,
  //           animationController: this.widget.animationController,
  //           widthScale: mainWidth,
  //         );
  //         items.add(Positioned(
  //           child: widget.list[i],
  //           left: (mediaQuery.size.width / 2) -
  //               widget.list[i].widthScale * mediaQuery.size.width / 2,
  //           // duration: Duration(seconds: 3),
  //         ));
  //         setState(() {});
  //       } else {
  //         //Other Widgets
  //         if (i < centerIndex) {
  //           widget.list[i] = SliderCard(
  //             icon: widget.list[i].icon,
  //             color: widget.list[i].color,
  //             iconColor: widget.list[i].iconColor,
  //             textColor: widget.list[i].textColor,
  //             title: widget.list[i].title,
  //             animationController: this.widget.animationController,
  //             widthScale: calculateWidthBelowCenter(i),
  //           );
  //           items.add(Positioned(
  //             child: widget.list[i],
  //             left: ((mediaQuery.size.width / 2) -
  //                     widget.list[i].widthScale * mediaQuery.size.width / 2) -
  //                 (centerIndex - i) * mediaQuery.size.width * 0.2,
  //             // duration: Duration(seconds: 3),
  //           ));
  //           setState(() {});
  //         } else {
  //           widget.list[i] = SliderCard(
  //             icon: widget.list[i].icon,
  //             color: widget.list[i].color,
  //             iconColor: widget.list[i].iconColor,
  //             textColor: widget.list[i].textColor,
  //             title: widget.list[i].title,
  //             animationController: this.widget.animationController,
  //             widthScale: calculateWidthAboveCenter(i),
  //           );
  //           items.insert(
  //               0,
  //               Positioned(
  //                 child: widget.list[i],
  //                 left: ((mediaQuery.size.width / 2) -
  //                         widget.list[i].widthScale *
  //                             mediaQuery.size.width /
  //                             2) +
  //                     (i - centerIndex) * mediaQuery.size.width * 0.2,
  //                 // duration: Duration(seconds: 3),
  //               ));
  //           setState(() {});
  //         }
  //       }
  //     } else {
  //       //ODD list Alignment
  //       if (i == centerIndex) {
  //         //Center Widget
  //         widget.list[i] = SliderCard(
  //           icon: widget.list[i].icon,
  //           color: widget.list[i].color,
  //           iconColor: widget.list[i].iconColor,
  //           textColor: widget.list[i].textColor,
  //           title: widget.list[i].title,
  //           animationController: this.widget.animationController,
  //           widthScale: mainWidth,
  //         );
  //         items.add(Positioned(
  //           child: widget.list[i],
  //           left: (mediaQuery.size.width / 2) -
  //               widget.list[i].widthScale * mediaQuery.size.width / 2,
  //           // duration: Duration(seconds: 3),
  //         ));
  //         setState(() {});
  //       } else {
  //         //Other Widgets
  //         if (i < centerIndex) {
  //           widget.list[i] = SliderCard(
  //             icon: widget.list[i].icon,
  //             color: widget.list[i].color,
  //             iconColor: widget.list[i].iconColor,
  //             textColor: widget.list[i].textColor,
  //             title: widget.list[i].title,
  //             animationController: this.widget.animationController,
  //             widthScale: calculateWidthBelowCenter(i),
  //           );
  //           items.add(Positioned(
  //             child: Center(child: widget.list[i]),
  //             left: ((mediaQuery.size.width / 2) -
  //                     widget.list[i].widthScale * mediaQuery.size.width / 2) -
  //                 (centerIndex - i) * mediaQuery.size.width * 0.2,
  //             // duration: Duration(seconds: 3),
  //           ));
  //           setState(() {});
  //         } else {
  //           widget.list[i] = SliderCard(
  //             icon: widget.list[i].icon,
  //             color: widget.list[i].color,
  //             iconColor: widget.list[i].iconColor,
  //             textColor: widget.list[i].textColor,
  //             title: widget.list[i].title,
  //             animationController: this.widget.animationController,
  //             widthScale: calculateWidthAboveCenter(i),
  //           );
  //           items.insert(
  //               0,
  //               Positioned(
  //                 child: widget.list[i],
  //                 left: ((mediaQuery.size.width / 2) -
  //                         widget.list[i].widthScale *
  //                             mediaQuery.size.width /
  //                             2) +
  //                     (i - centerIndex) * mediaQuery.size.width * 0.2,
  //                 // duration: Duration(seconds: 3),
  //               ));
  //           setState(() {});
  //         }
  //       }
  //     }
  //   }
  // }
  //
  // scrollStackReverse() {
  //   items = [];
  //   setState(() {});
  //   var mediaQuery = widget.mediaQuery;
  //
  //   var firstItem = widget.list[0];
  //   for (int i = 0; i < widget.list.length - 1; i++) {
  //     widget.list[i] = widget.list[i + 1];
  //   }
  //   widget.list[widget.list.length - 1] = firstItem;
  //   for (int i = 0; i < widget.list.length; i++) {
  //     if (widget.list.length % 2 == 0) {
  //       //Even List Alignment
  //       if (i == centerIndex) {
  //         //Center Widget
  //         widget.list[i] = SliderCard(
  //           icon: widget.list[i].icon,
  //           color: widget.list[i].color,
  //           iconColor: widget.list[i].iconColor,
  //           textColor: widget.list[i].textColor,
  //           title: widget.list[i].title,
  //           animationController: this.widget.animationController,
  //           widthScale: mainWidth,
  //         );
  //         items.add(Positioned(
  //           child: widget.list[i],
  //           left: (mediaQuery.size.width / 2) -
  //               widget.list[i].widthScale * mediaQuery.size.width / 2,
  //           // duration: Duration(seconds: 3),
  //         ));
  //         setState(() {});
  //       } else {
  //         //Other Widgets
  //         if (i < centerIndex) {
  //           widget.list[i] = SliderCard(
  //             icon: widget.list[i].icon,
  //             color: widget.list[i].color,
  //             iconColor: widget.list[i].iconColor,
  //             textColor: widget.list[i].textColor,
  //             title: widget.list[i].title,
  //             animationController: this.widget.animationController,
  //             widthScale: calculateWidthBelowCenter(i),
  //           );
  //           items.add(Positioned(
  //             child: widget.list[i],
  //             left: ((mediaQuery.size.width / 2) -
  //                     widget.list[i].widthScale * mediaQuery.size.width / 2) -
  //                 (centerIndex - i) * mediaQuery.size.width * 0.2,
  //             // duration: Duration(seconds: 3),
  //           ));
  //           setState(() {});
  //         } else {
  //           widget.list[i] = SliderCard(
  //             icon: widget.list[i].icon,
  //             color: widget.list[i].color,
  //             iconColor: widget.list[i].iconColor,
  //             textColor: widget.list[i].textColor,
  //             title: widget.list[i].title,
  //             animationController: this.widget.animationController,
  //             widthScale: calculateWidthAboveCenter(i),
  //           );
  //           items.insert(
  //               0,
  //               Positioned(
  //                 child: widget.list[i],
  //                 left: ((mediaQuery.size.width / 2) -
  //                         widget.list[i].widthScale *
  //                             mediaQuery.size.width /
  //                             2) +
  //                     (i - centerIndex) * mediaQuery.size.width * 0.2,
  //                 // duration: Duration(seconds: 3),
  //               ));
  //           setState(() {});
  //         }
  //       }
  //     } else {
  //       //ODD list Alignment
  //       if (i == centerIndex) {
  //         //Center Widget
  //         widget.list[i] = SliderCard(
  //           icon: widget.list[i].icon,
  //           color: widget.list[i].color,
  //           iconColor: widget.list[i].iconColor,
  //           textColor: widget.list[i].textColor,
  //           title: widget.list[i].title,
  //           animationController: this.widget.animationController,
  //           widthScale: mainWidth,
  //         );
  //         items.add(Positioned(
  //           child: widget.list[i],
  //           left: (mediaQuery.size.width / 2) -
  //               widget.list[i].widthScale * mediaQuery.size.width / 2,
  //           // duration: Duration(seconds: 3),
  //         ));
  //         setState(() {});
  //       } else {
  //         //Other Widgets
  //         if (i < centerIndex) {
  //           widget.list[i] = SliderCard(
  //             icon: widget.list[i].icon,
  //             color: widget.list[i].color,
  //             iconColor: widget.list[i].iconColor,
  //             textColor: widget.list[i].textColor,
  //             title: widget.list[i].title,
  //             animationController: this.widget.animationController,
  //             widthScale: calculateWidthBelowCenter(i),
  //           );
  //           items.add(Positioned(
  //             child: Center(child: widget.list[i]),
  //             left: ((mediaQuery.size.width / 2) -
  //                     widget.list[i].widthScale * mediaQuery.size.width / 2) -
  //                 (centerIndex - i) * mediaQuery.size.width * 0.2,
  //             // duration: Duration(seconds: 3),
  //           ));
  //           setState(() {});
  //         } else {
  //           widget.list[i] = SliderCard(
  //             icon: widget.list[i].icon,
  //             color: widget.list[i].color,
  //             iconColor: widget.list[i].iconColor,
  //             textColor: widget.list[i].textColor,
  //             title: widget.list[i].title,
  //             animationController: this.widget.animationController,
  //             widthScale: calculateWidthAboveCenter(i),
  //           );
  //           items.insert(
  //               0,
  //               Positioned(
  //                 child: widget.list[i],
  //                 left: ((mediaQuery.size.width / 2) -
  //                         widget.list[i].widthScale *
  //                             mediaQuery.size.width /
  //                             2) +
  //                     (i - centerIndex) * mediaQuery.size.width * 0.2,
  //                 // duration: Duration(seconds: 3),
  //               ));
  //           setState(() {});
  //         }
  //       }
  //     }
  //   }
  // }

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
