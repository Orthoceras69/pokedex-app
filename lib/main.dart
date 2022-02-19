import 'package:pokedex/views/listPoke.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: const HomePage(title: "Pokedex"),
  ));
}
