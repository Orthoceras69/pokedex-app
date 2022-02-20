import 'dart:convert';
import 'package:pokedex/models/url_pokemon.dart';
import 'package:http/http.dart' as http;

Future<List<UrlPokemon>> getUrlPokemonData() async {
  List<UrlPokemon> urlPokemonList = [];

  for (var compteur = 1; compteur <= 898; compteur++) {
    var url = Uri.https("pokeapi.co", '/api/v2/pokemon/$compteur');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      UrlPokemon urlPokemon = UrlPokemon(jsonResponse["id"].toString(),
          jsonResponse["name"], jsonResponse["sprites"]["front_default"]);
      urlPokemonList.add(urlPokemon);
    } else {
      print('Request failed : ${response.statusCode}');
    }
  }
  return urlPokemonList;
}
