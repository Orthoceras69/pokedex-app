import 'package:flutter/material.dart';
import '../views/pokemon.dart';

Widget myTodoButton(BuildContext context, String idPokemon, String name) {
  return IconButton(
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Pokemon(
                    idPokemon: idPokemon,
                    name: name,
                  )));
    },
    icon: const Icon(Icons.arrow_forward_ios),
  );
}
