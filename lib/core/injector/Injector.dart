import 'package:archi_app/core/repositories/characters/CharactersRepository.dart';
import 'package:archi_app/core/repositories/planets/PlanetsRepository.dart';
import 'package:archi_app/core/repositories/species/SpeciesRepository.dart';
import 'package:get_it/get_it.dart';

class Injector {
  var injector = GetIt.instance;
  
  void setup() {
    injector.registerLazySingleton<CharactersRepository>(() => CharacterRepositoryImpl());
    injector.registerLazySingleton<SpeciesRepository>(() => SpeciesRepositoryImpl());
    injector.registerLazySingleton<PlanetsRepository>(() => PlanetsRepositoryImpl());
  }
}