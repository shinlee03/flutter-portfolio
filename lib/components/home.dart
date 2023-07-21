import 'package:flutter/material.dart';
import 'package:portfolio/components/contact.dart';

class Home extends StatefulWidget {
  Home({super.key});

  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  build(BuildContext c) {
    return Scaffold(
        appBar: AppBar(leading: true, actions: [
          IconButton(
              icon: Icon(Icons.abc),
              onPressed: () {
                Navigator.of(c).push(MaterialPageRoute(
                  builder: (c) => Scaffold(
                      appBar: AppBar(
                        actions: [
                          IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {}),
                        ],
                      ),
                      body: Contact()),
                ));
              })
        ]),
        body: Padding(
          padding: EdgeInsets.only(top: 70),
          child: Center(
              child: Column(children: <Widget>[
            Text(
              "Hello!",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text("Welcome to Shin's Portfolio."),
          ])),
        ));
  }
}
