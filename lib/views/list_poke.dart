import 'package:flutter/material.dart';
import 'package:pokedex/services/url_pokemon_service.dart';
import '../widgets/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  TextEditingController searchPokemon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List>(
        future: getUrlPokemonData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading..."));
          } else if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: Image.network(snapshot.data![i].sprite),
                    title: Text(snapshot.data![i].name),
                    subtitle: Text("n°" +
                        ("000" + snapshot.data![i].id).substring(
                            (snapshot.data![i].id).length,
                            (snapshot.data![i].id).length + 3)),
                    trailing: myTodoButton(
                        context, snapshot.data![i].id, snapshot.data![i].name),
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
