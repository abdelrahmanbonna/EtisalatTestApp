import 'package:flutter/material.dart';

class SliderCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final Color color, textColor, iconColor;
  final double width,
      animationStartOffsetX,
      animationStartOffsetY,
      animationEndOffsetX,
      animationEndOffsetY;
  SliderCard(
      {@required this.icon,
      @required this.color,
      @required this.title,
      @required this.textColor,
      @required this.iconColor,
      this.animationStartOffsetX,
      this.animationStartOffsetY,
      this.animationEndOffsetX,
      this.animationEndOffsetY,
      this.width = 0.5});
  @override
  _SliderCardState createState() => _SliderCardState();
}

class _SliderCardState extends State<SliderCard>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(1.5, 0.0), //TODO change to real offsets
      ).animate(_animationController),
      child: AnimatedContainer(
        duration: Duration(
          seconds: 1,
        ),
        width: mediaQuery.size.width * this.widget.width,
        height: mediaQuery.size.width * this.widget.width,
        decoration: BoxDecoration(
          color: this.widget.color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                this.widget.icon,
                size: 50,
                color: widget.iconColor,
              ),
              Text(
                this.widget.title,
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
