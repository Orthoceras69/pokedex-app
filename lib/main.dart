import 'package:pokedex/views/list_poke.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: const HomePage(title: "Pokedex"),
  ));
}
