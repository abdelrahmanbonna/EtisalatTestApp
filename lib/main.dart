import 'package:etisalat_app/customSlider.dart';
import 'package:etisalat_app/widgets/sliderCard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Etisalat Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Etisalat Demo'),
      ),
      body: SafeArea(
        child: Center(
          child: CustomSlider(
            mediaQuery: MediaQuery.of(context),
            heightScale: 0.7,
            // widthScale: 0.5,
            list: [
              SliderCard(
                title: 'Home',
                icon: Icons.home,
                color: Colors.green,
                iconColor: Colors.white,
                textColor: Colors.white,
                widthScale: 0.3,
              ),
              SliderCard(
                title: 'Environment',
                icon: Icons.eco,
                color: Colors.amber,
                iconColor: Colors.white,
                textColor: Colors.white,
                widthScale: 0.3,
              ),
              SliderCard(
                title: 'Exit',
                icon: Icons.dangerous,
                color: Colors.blue,
                iconColor: Colors.white,
                textColor: Colors.white,
                widthScale: 0.3,
              ),
              SliderCard(
                title: 'Password',
                icon: Icons.seven_k_plus,
                color: Colors.red,
                iconColor: Colors.white,
                textColor: Colors.white,
                widthScale: 0.3,
              ),
              SliderCard(
                title: 'Share',
                icon: Icons.qr_code,
                color: Colors.yellow,
                textColor: Colors.black,
                iconColor: Colors.black,
                widthScale: 0.3,
              ),
              SliderCard(
                title: 'Family',
                icon: Icons.family_restroom_sharp,
                color: Colors.pink,
                textColor: Colors.black,
                iconColor: Colors.black,
                widthScale: 0.3,
              ),
              SliderCard(
                title: 'Computers',
                icon: Icons.computer,
                color: Colors.white,
                textColor: Colors.black,
                iconColor: Colors.black,
                widthScale: 0.2,
              ),
            ],
          ),
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
//     _controller.animateWith(simulation);
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
