import 'dart:collection';

import 'package:archi_app/core/models/Character.dart';
import 'package:archi_app/core/models/Planet.dart';
import 'package:archi_app/core/models/Species.dart';
import 'package:archi_app/core/repositories/characters/CharactersRepository.dart';
import 'package:archi_app/core/repositories/planets/PlanetsRepository.dart';
import 'package:archi_app/core/repositories/species/SpeciesRepository.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class HomeViewModel with ChangeNotifier {
  List<Character> _characters = [];
  List<Species> _species = [];
  List<Planet> _planets = [];

  List<Character> get characters => _characters;
  List<Species> get species => _species;
  List<Planet> get planets => _planets;

  void loadData() async {
    GetIt.instance.get<CharactersRepository>().getCharacters()
        .then((value) => _setCharacters(value));
    GetIt.instance.get<PlanetsRepository>().getPlanets()
      .then((value) => _setPlanets(value));
    GetIt.instance.get<SpeciesRepository>().getSpeciesList()
        .then((value) => _setSpecies(value));
  }

  void _setCharacters(List<Character> value) {
    _characters = value;
    notifyListeners();
  }

  _setPlanets(List<Planet> value) {
    _planets = value;
    notifyListeners();
  }

  _setSpecies(List<Species> value) {
    _species = value;
    notifyListeners();
  }
}
