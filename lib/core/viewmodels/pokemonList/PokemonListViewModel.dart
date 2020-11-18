import 'dart:collection';

import 'package:archi_app/core/injector/Injector.dart';
import 'package:archi_app/core/models/PokemonList.dart';
import 'package:archi_app/core/models/Pokemon.dart';
import 'package:archi_app/core/repositories/PokemonRepository.dart';
import 'package:flutter/cupertino.dart';

class PokemonListViewModel with ChangeNotifier {
  int _limit = 5;
  int _offset = 0;
  bool _isReset = true;
  String get title => "Pokemons";
  PokemonList _pokemonList;
  List<Pokemon> _pokemons = [];
  UnmodifiableListView<Pokemon> get pokemons => UnmodifiableListView(_pokemons);

  PokemonRepository _repository = injector.get<PokemonRepository>();

  void loadData() {
    _repository.get(_limit, _offset)
        .then((value) => _setPokemonList(value));
    _offset += _limit;
  }

  void resetData() {
    _offset = 0;
    _isReset = true;
  }

  void _setPokemonList(PokemonList value) {
    _pokemonList = value;
    _fetchPokemons();
  }

  Future<void> _fetchPokemons() async {
    List<Pokemon> list = [];

    for (var result in _pokemonList.results) {
      var pokemon = await _repository.getPokemon(result.name);
      list.add(pokemon);
    }

    if (_isReset) {
      _pokemons = list;
      _isReset = false;
    } else {
      _pokemons.addAll(list);
    }

    notifyListeners();
  }
}