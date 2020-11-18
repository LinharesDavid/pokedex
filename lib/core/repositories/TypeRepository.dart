import 'dart:convert';

import 'package:archi_app/core/models/TypeList.dart';
import 'package:archi_app/core/models/Type.dart';
import 'package:archi_app/core/repositories/BaseRepository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class TypeRepository extends BaseRepository {
  Future<TypeList> get(int limit, int offset);
  Future<PokemonType> getType(String name);
}

class TypeRepositoryImpl extends TypeRepository {
  @override
  Future<TypeList> get(int limit, int offset) async {
    var response = await http.get("$baseUrl/type");

    if (response.statusCode == 200) {
      return TypeList.typeListFromJson(response.body);
    }

    return null;
  }

  @override
  Future<PokemonType> getType(String name) async {
    var response = await http.get("$baseUrl/type/$name");

    if (response.statusCode == 200) {
      return PokemonType.fromJson(jsonDecode(response.body));
    }

    return null;
  }

}