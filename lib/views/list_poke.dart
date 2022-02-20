import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pokedex/services/url_pokemon_service.dart';
import 'package:pokedex/models/url_pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<UrlPokemon>>(
        future: getUrlPokemonData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading..."));
          } else if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: 898,
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: Image.network(snapshot.data![i].sprite),
                    title: Text(snapshot.data![i].name),
                    trailing: Text("ID N°" + snapshot.data![i].id),
                  );
                });
          } else {
            return const Text("An error occured.");
          }
        },
      ),
    );
  }
}
