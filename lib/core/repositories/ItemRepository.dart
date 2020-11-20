import 'dart:convert';

import 'package:archi_app/core/models/Item.dart';
import 'package:archi_app/core/models/ItemList.dart';
import 'package:archi_app/core/repositories/PokemonBaseRepository.dart';
import 'package:http/http.dart' as http;

abstract class ItemRepository extends PokemonBaseRepository {
  Future<ItemList> get(int limit, int offset);
  Future<Item> getItem(String name);
}

class ItemRepositoryImpl extends ItemRepository {
  @override
  Future<ItemList> get(int limit, int offset) async {
    var response = await http.get("$baseUrl/item?limit=$limit&offset=$offset");

    if (response.statusCode == 200) {
      return ItemList.itemListFromJson(response.body);
    }

    return null;
  }

  @override
  Future<Item> getItem(String name) async {
    var response = await http.get("$baseUrl/item/$name");

    if (response.statusCode == 200) {
      return Item.fromJson(jsonDecode(response.body));
    }

    return null;
  }

}