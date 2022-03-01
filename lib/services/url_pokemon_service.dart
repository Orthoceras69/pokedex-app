import 'dart:convert';
import 'package:pokedex/models/url_pokemon.dart';
import 'package:http/http.dart' as http;

Future<List<UrlPokemon>> getUrlPokemonData() async {
  List<UrlPokemon> urlPokemonList = [];

  var queryParameter = {'offset': '0', 'limit': '898'};
  int id = 1;

  var url = Uri.https("pokeapi.co", '/api/v2/pokemon', queryParameter);
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    for (var data in jsonResponse["results"]) {
      if (id == 899) {
        id = 10001;
      }
      UrlPokemon urlPokemon = UrlPokemon(
          ((data["name"].toString()).substring(0, 1)).toUpperCase() +
              (data["name"].toString()).substring(1),
          data["url"].toString(),
          id.toString(),
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/" +
              id.toString() +
              ".png");
      urlPokemonList.add(urlPokemon);
      id = id + 1;
    }
  } else {
    print('Request failed : ${response.statusCode}');
  }

  return urlPokemonList;
}
