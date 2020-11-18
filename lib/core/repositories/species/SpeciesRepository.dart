import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:archi_app/core/models/Species.dart';
import 'package:http/http.dart' as http;

abstract class SpeciesRepository {
  String _baseUrl = "http://intergalacticdb.me/api/planets";
  Future<List<Species>>getSpeciesList();
  Future<Species>getSpecies(String name);
}

class SpeciesRepositoryImpl extends SpeciesRepository {
  @override
  Future<Species> getSpecies(String name) async {
    final response = await http.get("$_baseUrl/$name");
    if (response.statusCode == 200) {
      return Species.fromJson(jsonDecode(response.body));
    }

    return null;
  }

  @override
  Future<List<Species>> getSpeciesList() async {
    final response = await http.get("$_baseUrl");
    if (response.statusCode == 200) {
      Iterable iterable = jsonDecode(response.body);
      return iterable.map((e) => Species.fromJson(e)).toList();
    }

    return List.empty();
  }

}