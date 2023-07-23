import 'package:flutter/material.dart';
import 'package:portfolio/components/contact.dart';
import 'package:portfolio/components/education.dart';

class Home extends StatefulWidget {
  Home({super.key});

  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  build(BuildContext c) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(c).primaryColor,
            title: Text("Shin's Portfolio"),
            leading: Padding(
              child: InkWell(
                  child: CircleAvatar(
                      backgroundImage: AssetImage('lib/res/shin_03.jpeg')),
                  onTap: () {
                    showDialog(
                        context: c,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              content: Stack(children: <Widget>[
                            Positioned(
                              child: Text("Profile Dialogue here!."),
                            )
                          ]));
                        });
                  }),
              padding: EdgeInsets.only(bottom: 5, top: 5, left: 20),
            ),
            actions: [
              Padding(
                  child: GestureDetector(
                      child: Text("Contact Me"),
                      onTap: () {
                        Navigator.of(c).push(MaterialPageRoute(
                          builder: (c) => Scaffold(
                              appBar: AppBar(
                                backgroundColor: Theme.of(c).primaryColor,
                              ),
                              body: Contact()),
                        ));
                      }),
                  padding: EdgeInsets.only(top: 20, right: 30)),
            ]),
        body: Padding(
          padding: EdgeInsets.only(top: 70),
          child: Center(
              child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Simplicity, Portabilty, and Flow.",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
                "I am a Flutter developer who works with mobile, web, and desktop\napplications development.",
                style: TextStyle(fontSize: 18)),
            Education(),
          ])),
        ));
  }
}
