// import 'package:flutter/material.dart';
// import 'package:flutter/physics.dart';
//
// class SliderCard extends StatefulWidget {
//   final IconData icon;
//   final String title;
//   final Color color, textColor, iconColor;
//   final double widthScale;
//   final Offset panOffset;
//   final MediaQueryData mediaQuery;
//   final AnimationController animationController;
//   SliderCard(
//       {@required this.icon,
//       @required this.color,
//       @required this.title,
//       @required this.textColor,
//       @required this.iconColor,
//       this.panOffset = const Offset(0.0, 0.0),
//       this.mediaQuery,
//       @required this.animationController,
//       this.widthScale = 0.5});
//   @override
//   _SliderCardState createState() => _SliderCardState();
// }
//
// class _SliderCardState extends State<SliderCard> {
//   AnimationController _animationController;
//   Alignment _dragAlignment = Alignment.center;
//   Animation<Alignment> _animation;
//
//   @override
//   void initState() {
//     _animationController = widget.animationController;
//     _dragAlignment = Alignment(widget.panOffset.dx, widget.panOffset.dy);
//     super.initState();
//     _animationController.addListener(() {
//       setState(() {
//         _dragAlignment = _animation.value;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   /// Calculates and runs a [SpringSimulation].
//   void _runAnimation(Offset pixelsPerSecond, Size size) {
//     _animation = _animationController.drive(
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
//     _animationController.animateWith(simulation);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var mediaQuery = MediaQuery.of(context);
//     return GestureDetector(
//       onPanEnd: (details) {
//         _runAnimation(details.velocity.pixelsPerSecond, mediaQuery.size);
//       },
//       onPanUpdate: (details) {
//         setState(() {
//           _dragAlignment += Alignment(
//             details.delta.dx / (mediaQuery.size.width / 2),
//             details.delta.dy / (mediaQuery.size.height / 2), //
//           );
//         });
//       },
//       onPanDown: (details) {
//         _animationController.stop();
//       },
//       child: AnimatedContainer(
//         duration: Duration(
//           seconds: 1,
//         ),
//         width: mediaQuery.size.width * this.widget.widthScale,
//         height: mediaQuery.size.width * this.widget.widthScale,
//         decoration: BoxDecoration(
//           color: this.widget.color,
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey,
//               blurRadius: 10,
//             ),
//           ],
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 this.widget.icon,
//                 size: mediaQuery.size.width * this.widget.widthScale / 2.5,
//                 color: widget.iconColor,
//               ),
//               Text(
//                 this.widget.title,
//                 style: TextStyle(
//                   color: widget.textColor,
//                   fontSize: mediaQuery.size.width * this.widget.widthScale / 10,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// //
//
// //
// // main() {
// //   runApp(MaterialApp(home: PhysicsCardDragDemo()));
// // }
// //
// // class PhysicsCardDragDemo extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(),
// //       body: Stack(
// //         children: [
// //           DraggableCard(
// //             child: FlutterLogo(
// //               size: 128,
// //             ),
// //           ),
// //           DraggableCard(
// //             child: FlutterLogo(
// //               size: 128,
// //             ),
// //           ),
// //           DraggableCard(
// //             child: FlutterLogo(
// //               size: 128,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
