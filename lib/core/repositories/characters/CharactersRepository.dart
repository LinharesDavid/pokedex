import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:archi_app/core/models/Character.dart';
import 'package:http/http.dart' as http;

abstract class CharactersRepository {
  String _baseUrl = "http://intergalacticdb.me/api/characters";
  Future<List<Character>>getCharacters();
  Future<Character>getCharacter(String name);
}

class CharacterRepositoryImpl extends CharactersRepository {
  @override
  Future<Character> getCharacter(String name) async {
    final response = await http.get("$_baseUrl/$name");
    if (response.statusCode == 200) {
      return Character.fromJson(jsonDecode(response.body));
    }

    return null;
  }

  @override
  Future<List<Character>> getCharacters() async {
    final response = await http.get("$_baseUrl");
    if (response.statusCode == 200) {
      Iterable iterable = jsonDecode(response.body);
      return iterable.map((e) => Character.fromJson(e)).toList();
    }

    return List.empty();
  }

}