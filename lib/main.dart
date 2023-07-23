import 'package:flutter/material.dart';
import 'package:portfolio/components/home.dart';

void main() {
  runApp(MaterialApp(
    title: "Shin L.",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Color.fromARGB(255, 98, 204, 118),
      primarySwatch: Colors.lightGreen,
    ),
    home: Home(),
  ));
}
