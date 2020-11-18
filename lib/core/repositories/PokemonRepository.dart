import 'dart:convert';

import 'package:archi_app/core/models/PokemonList.dart';
import 'package:archi_app/core/models/Pokemon.dart';
import 'package:archi_app/core/repositories/BaseRepository.dart';
import 'package:http/http.dart' as http;

abstract class PokemonRepository extends BaseRepository {
    Future<PokemonList> get(int limit, int offset);
    Future<Pokemon> getPokemon(String name);
}

class PokemonRepositoryImpl extends PokemonRepository {
  @override
  Future<PokemonList> get(int limit, int offset) async {
    var response = await http.get("$baseUrl/pokemon?limit=$limit&offset=$offset");

    if (response.statusCode == 200) {
      return PokemonList.pokemonListFromJson(response.body);
    }

    return null;
  }

  @override
  Future<Pokemon> getPokemon(String name) async {
    var response = await http.get("$baseUrl/pokemon/$name");

    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    }

    return null;
  }

}