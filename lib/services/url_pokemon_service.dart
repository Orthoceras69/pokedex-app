import 'dart:convert';
import 'package:pokedex/models/url_pokemon.dart';
import 'package:http/http.dart' as http;

Future<List<UrlPokemon>> getUrlPokemonData() async {
  List<UrlPokemon> urlPokemonList = [];

  var queryParameter = {'offset': '0', 'limit': '2000'};

  var url = Uri.https("pokeapi.co", '/api/v2/pokemon', queryParameter);
  print(url);
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    for (var data in jsonResponse["results"]) {
      UrlPokemon urlPokemon = UrlPokemon(data["name"], data["url"]);
      urlPokemonList.add(urlPokemon);
    }
    //UrlPokemon urlPokemon =
    //    UrlPokemon(jsonResponse["name"], jsonResponse["url"]);
    //urlPokemonList.add(urlPokemon);
  } else {
    print('Request failed : ${response.statusCode}');
  }

  return urlPokemonList;
}
