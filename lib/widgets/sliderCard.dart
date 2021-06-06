import 'package:flutter/material.dart';

class SliderCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final Color color, textColor, iconColor;
  final double widthScale;
  SliderCard(
      {@required this.icon,
      @required this.color,
      @required this.title,
      @required this.textColor,
      @required this.iconColor,
      this.widthScale = 0.5});
  @override
  _SliderCardState createState() => _SliderCardState();
}

class _SliderCardState extends State<SliderCard> {
  AnimationController _animationController;

  @override
  void initState() {
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
    return AnimatedContainer(
      duration: Duration(
        seconds: 1,
      ),
      width: mediaQuery.size.width * this.widget.widthScale,
      height: mediaQuery.size.width * this.widget.widthScale,
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
              size: mediaQuery.size.width * this.widget.widthScale / 2.5,
              color: widget.iconColor,
            ),
            Text(
              this.widget.title,
              style: TextStyle(
                color: widget.textColor,
                fontSize: mediaQuery.size.width * this.widget.widthScale / 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:flutter/physics.dart';
//
// main() {
//   runApp(MaterialApp(home: PhysicsCardDragDemo()));
// }
//
// class PhysicsCardDragDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Stack(
//         children: [
//           DraggableCard(
//             child: FlutterLogo(
//               size: 128,
//             ),
//           ),
//           DraggableCard(
//             child: FlutterLogo(
//               size: 128,
//             ),
//           ),
//           DraggableCard(
//             child: FlutterLogo(
//               size: 128,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// /// A draggable card that moves back to [Alignment.center] when it's
// /// released.
// class DraggableCard extends StatefulWidget {
//   final Widget child;
//   DraggableCard({@required this.child});
//
//   @override
//   _DraggableCardState createState() => _DraggableCardState();
// }
//
// class _DraggableCardState extends State<DraggableCard>
//     with SingleTickerProviderStateMixin {
//   AnimationController _controller;
//
//   /// The alignment of the card as it is dragged or being animated.
//   ///
//   /// While the card is being dragged, this value is set to the values computed
//   /// in the GestureDetector onPanUpdate callback. If the animation is running,
//   /// this value is set to the value of the [_animation].
//   Alignment _dragAlignment = Alignment.center;
//
//   Animation<Alignment> _animation;
//
//   /// Calculates and runs a [SpringSimulation].
//   void _runAnimation(Offset pixelsPerSecond, Size size) {
//     _animation = _controller.drive(
//       AlignmentTween(
//         begin: _dragAlignment,
//         end: _dragAlignment,
//       ),
//     );
//     // Calculate the velocity relative to the unit interval, [0,1],
//     // used by the animation controller.
//     final unitsPerSecondX = pixelsPerSecond.dx / size.width;
//     final unitsPerSecondY = pixelsPerSecond.dy / size.height;
//     final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
//     final unitVelocity = unitsPerSecond.distance;
//
//     const spring = SpringDescription(
//       mass: 30,
//       stiffness: 1,
//       damping: 1,
//     );
//
//     final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);
//
//     _controller.animateWith(simulation);TODO
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this);
//
//     _controller.addListener(() {
//       setState(() {
//         _dragAlignment = _animation.value;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return GestureDetector(
//       onPanDown: (details) {
//         _controller.stop();
//       },
//       onPanUpdate: (details) {
//         setState(() {
//           _dragAlignment += Alignment(
//             details.delta.dx / (size.width / 2),
//             0.0, //details.delta.dy / (size.height / 2)
//           );
//         });
//       },
//       onPanEnd: (details) {
//         _runAnimation(details.velocity.pixelsPerSecond, size);
//       },
//       child: Align(
//         alignment: _dragAlignment,
//         child: Card(
//           child: widget.child,
//         ),
//       ),
//     );
//   }
// }
