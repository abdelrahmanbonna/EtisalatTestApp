import 'package:etisalat_app/widgets/card_item.dart';
import 'package:etisalat_app/widgets/cards.dart';
import 'package:flutter/material.dart';

import 'horizontal_card_carousel.dart';

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

    List<CardItem> items = [
      MenuCardItem(
        title: "Alarm",
        icon: Icons.access_alarms,
        iconSize: 60,
      ),
      MenuCardItem(
        title: "Add",
        icon: Icons.add,
        iconSize: 60,
      ),
      MenuCardItem(
        title: "Call",
        icon: Icons.add_call,
        iconSize: 60,
      ),
      MenuCardItem(
        title: "WiFi",
        icon: Icons.wifi,
        iconSize: 60,
      ),
      MenuCardItem(
        title: "File",
        icon: Icons.attach_file,
        iconSize: 60,
        color: Colors.amber,
        textColor: Colors.black,
        iconColor: Colors.black,
        fontSize: 25,
      ),
      MenuCardItem(
        title: "Air Play",
        icon: Icons.airplay,
        iconSize: 60,
        color: Colors.blueAccent,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Etisalat Demo'),
        backgroundColor: Colors.lightGreen,
      ),
      body: SafeArea(
        child: Center(
          child: HorizontalCardCarousel(
            onPageChanged: (page) => print("page : $page"),
            onSelectedItem: (page) => print("selected : $page"),
            items: items,
          ),
        ),
      ),
    );
  }
}
