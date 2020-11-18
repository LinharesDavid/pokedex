import 'dart:collection';

import 'package:archi_app/core/injector/Injector.dart';
import 'package:archi_app/core/models/Pokemon.dart';
import 'package:archi_app/core/models/PokemonList.dart';
import 'package:archi_app/core/repositories/PokemonRepository.dart';
import 'package:archi_app/core/viewmodels/DataListViewModel.dart';

class PokemonListViewModel extends DataListViewModel {
  String get title => "Pokemons";
  ItemList _pokemonList;
  List<Item> _pokemons = [];

  UnmodifiableListView<Item> get pokemons => UnmodifiableListView(_pokemons);

  PokemonRepository _repository = injector.get<PokemonRepository>();

  PokemonListViewModel() {
    loadData();
  }

  void loadData() {
    _repository.get(limit, offset).then((value) => _setPokemonList(value));
    offset += limit;
  }

  void _setPokemonList(ItemList value) {
    _pokemonList = value;
    _fetchPokemons();
  }

  Future<void> _fetchPokemons() async {
    List<Item> list = [];

    for (var result in _pokemonList.results) {
      var pokemon = await _repository.getPokemon(result.name);
      list.add(pokemon);
    }

    if (isReset) {
      _pokemons = list;
      isReset = false;
    } else {
      _pokemons.addAll(list);
    }

    notifyListeners();
  }
}
