import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/components/contact.dart';

class Home extends StatefulWidget {
  Home({super.key});

  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final AnimationController _checkcontroller;

  @override
  initState() {
    super.initState();
    _checkcontroller = AnimationController(vsync: this);
  }

  @override
  dispose() {
    _checkcontroller.dispose();
    super.dispose();
  }

  @override
  build(BuildContext c) {
    return Scaffold(
        appBar: null,
        body: Padding(
          padding: EdgeInsets.only(top: 70),
          child: Center(
              child: Column(children: <Widget>[
            Text(
              "Hello!",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text("Welcome to Shin's Portfolio."),
            Contact(),
          ])),
        ));
  }
}
