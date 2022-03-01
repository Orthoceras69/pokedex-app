import 'dart:convert';
import 'package:pokedex/models/data_pokemon.dart';
import 'package:http/http.dart' as http;

Future<DataPokemon> getDataPokemon(String id) async {
  var urlPoke = Uri.https("pokeapi.co", "/api/v2/pokemon/$id");
  var responsePoke = await http.get(urlPoke);
  if (responsePoke.statusCode == 200) {
    var jsonResponsePoke = jsonDecode(responsePoke.body);

    var urlSpecies = Uri.https(
        "pokeapi.co", (jsonResponsePoke["species"]["url"]).substring(17));
    var responseSpecies = await http.get(urlSpecies);
    if (responseSpecies.statusCode == 200) {
      var jsonResponseSpecies = jsonDecode(responseSpecies.body);

      List<String> pokemonTypes = [];
      for (var data in jsonResponsePoke["types"]) {
        String type = data["type"]["name"];
        pokemonTypes.add(type);
      }
      List<String> pokemonAbilities = [];
      for (var data in jsonResponsePoke["abilities"]) {
        String ability = data["ability"]["name"];
        pokemonAbilities.add(ability);
      }
      List<String> pokemonDescription = [];
      for (var data in jsonResponseSpecies["flavor_text_entries"]) {
        String description = data["flavor_text"];
        pokemonDescription.add(description);
      }

      return DataPokemon(
          jsonResponsePoke["name"],
          jsonResponsePoke["id"].toString(),
          jsonResponsePoke["sprites"]["front_default"],
          jsonResponsePoke["sprites"]["back_default"],
          jsonResponsePoke["sprites"]["front_shiny"],
          jsonResponsePoke["sprites"]["back_shiny"],
          jsonResponsePoke["height"].toString(),
          jsonResponsePoke["weight"].toString(),
          jsonResponsePoke["O"]["base_stat"].toString(),
          jsonResponsePoke["1"]["base_stat"].toString(),
          jsonResponsePoke["2"]["base_stat"].toString(),
          jsonResponsePoke["3"]["base_stat"].toString(),
          jsonResponsePoke["4"]["base_stat"].toString(),
          jsonResponsePoke["5"]["base_stat"].toString(),
          jsonResponsePoke["base_experience"].toString(),
          jsonResponseSpecies["base_happiness"].toString(),
          jsonResponseSpecies["7"]["genus"],
          jsonResponseSpecies["generation"]["name"],
          jsonResponseSpecies["habitat"]["name"],
          pokemonTypes,
          pokemonAbilities,
          pokemonDescription);
    } else {
      print('Request Species failed : ${responseSpecies.statusCode}');
    }
  } else {
    print('Request Pokemon failed : ${responsePoke.statusCode}');
  }
  return DataPokemon(
      "Error",
      "Error",
      "Error",
      "Error",
      "Error",
      "Error",
      "Error",
      "Error",
      "Error",
      "Error",
      "Error",
      "Error",
      "Error",
      "Error",
      "Error",
      "Error",
      "Error",
      "Error",
      "Error",
      ["Error"],
      ["Error"],
      ["Error"]);
}
