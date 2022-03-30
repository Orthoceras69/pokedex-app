import 'package:flutter/material.dart';
import '../models/data_pokemon.dart';
import '../services/data_pokemon_service.dart';

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
      body: FutureBuilder<DataPokemon>(
        future: getDataPokemon(widget.idPokemon),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading..."));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name : " + snapshot.data!.name),
                        Text("Pokemon n° " +
                            ("000" + snapshot.data!.id).substring(
                                (snapshot.data!.id).length,
                                (snapshot.data!.id).length + 3)),
                        Text("Height : " +
                            ("0" + snapshot.data!.height).substring(
                                (snapshot.data!.height).length == 1 ? 0 : 1,
                                (snapshot.data!.height).length) +
                            "," +
                            (snapshot.data!.height)
                                .substring((snapshot.data!.height).length - 1) +
                            " m"),
                        Text("Weight : " +
                            ("0" + snapshot.data!.weight).substring(
                                (snapshot.data!.weight).length == 1 ? 0 : 1,
                                (snapshot.data!.weight).length) +
                            "," +
                            (snapshot.data!.weight)
                                .substring((snapshot.data!.weight).length - 1) +
                            " kg"),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              image: AssetImage(
                                  "assets/img/type/type_horizontal/" +
                                      snapshot.data!.types[0] +
                                      ".png"),
                              width: 75,
                            ),
                            (snapshot.data!.types[1] != "")
                                ? Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Image(
                                      image: AssetImage(
                                          "assets/img/type/type_horizontal/" +
                                              snapshot.data!.types[1] +
                                              ".png"),
                                      width: 75,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image(
                        image: NetworkImage(snapshot.data!.spriteNormalFront),
                        width: 175,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                )
              ]),
            );
          }
          return const Text("An error occured.");
        },
      ),
    );
  }
}
