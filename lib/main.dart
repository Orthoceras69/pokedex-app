import 'package:pokedex/views/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: const MyHomePage(title: "Pokedex"),
  ));
}
