import 'package:flutter/material.dart';

class Pokemon extends StatelessWidget {
  const Pokemon({Key? key, required this.idPokemon, required this.name})
      : super(key: key);

  final String idPokemon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return PokemonSF(idPokemon: idPokemon, name: name);
  }
}

class PokemonSF extends StatefulWidget {
  const PokemonSF({Key? key, required this.idPokemon, required this.name})
      : super(key: key);

  final String idPokemon;
  final String name;
  @override
  State<PokemonSF> createState() => _PokemonState();
}

class _PokemonState extends State<PokemonSF> {
  late bool valueCheck;

  @override
  void initState() {
    super.initState();
    valueCheck = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: const Text("Test"),
    );
  }
}
