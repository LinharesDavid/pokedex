import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:archi_app/core/models/Planet.dart';
import 'package:http/http.dart' as http;

abstract class PlanetsRepository {
  String _baseUrl = "http://intergalacticdb.me/api/planets";
  Future<List<Planet>>getPlanets();
  Future<Planet>getPlanet(String name);
}

class PlanetsRepositoryImpl extends PlanetsRepository {
  @override
  Future<Planet> getPlanet(String name) async {
    final response = await http.get("$_baseUrl/$name");
    if (response.statusCode == 200) {
      return Planet.fromJson(jsonDecode(response.body));
    }

    return null;
  }

  @override
  Future<List<Planet>> getPlanets() async {
    final response = await http.get("$_baseUrl");
    if (response.statusCode == 200) {
      Iterable iterable = jsonDecode(response.body);
      return iterable.map((e) => Planet.fromJson(e)).toList();
    }

    return List.empty();
  }

}