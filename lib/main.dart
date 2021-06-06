import 'package:etisalat_app/customSlider.dart';
import 'package:flutter/material.dart';

import 'widgets/dragAbleCard.dart';

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

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Etisalat Demo'),
        backgroundColor: Colors.lightGreen,
      ),
      body: SafeArea(
        child: Center(
          child: CustomSlider(
            heightScale: 0.7,
            animationController: animationController,
            list: [
              DraggableCard(
                title: 'Environment',
                icon: Icons.eco,
                color: Colors.amber,
                iconColor: Colors.white,
                textColor: Colors.white,
                height: mediaQuery.size.width * 0.5,
                animationController: animationController,
                fontSize: 16,
              ),
              DraggableCard(
                title: 'Exit',
                icon: Icons.dangerous,
                color: Colors.blue,
                iconColor: Colors.white,
                textColor: Colors.white,
                height: mediaQuery.size.width * 0.5,
                animationController: animationController,
                fontSize: 16,
              ),
              DraggableCard(
                height: mediaQuery.size.width * 0.5,
                title: 'Share',
                icon: Icons.qr_code,
                color: Colors.yellow,
                textColor: Colors.black,
                iconColor: Colors.black,
                fontSize: 16,
                animationController: animationController,
              ),
              DraggableCard(
                height: mediaQuery.size.width * 0.5,
                title: 'Family',
                icon: Icons.family_restroom_sharp,
                color: Colors.pink,
                textColor: Colors.black,
                iconColor: Colors.black,
                fontSize: 16,
                animationController: animationController,
              ),
              DraggableCard(
                height: mediaQuery.size.width * 0.5,
                title: 'Family',
                icon: Icons.family_restroom_sharp,
                color: Colors.brown,
                textColor: Colors.black,
                iconColor: Colors.black,
                fontSize: 16,
                animationController: animationController,
              ),
              DraggableCard(
                height: mediaQuery.size.width * 0.5,
                title: 'Family',
                icon: Icons.family_restroom_sharp,
                color: Colors.lightGreen,
                textColor: Colors.black,
                iconColor: Colors.black,
                fontSize: 16,
                animationController: animationController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
