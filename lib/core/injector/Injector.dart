import 'package:archi_app/core/repositories/PokemonRepository.dart';
import 'package:archi_app/core/repositories/TypeRepository.dart';
import 'package:archi_app/core/viewmodels/home/HomeViewModel.dart';
import 'package:archi_app/core/viewmodels/pokemonList/PokemonListViewModel.dart';
import 'package:archi_app/core/viewmodels/typesList/TypesListViewModel.dart';
import 'package:get_it/get_it.dart';

GetIt injector = GetIt.instance;

void setup() {
  // repositories
  injector.registerLazySingleton<PokemonRepository>(() => PokemonRepositoryImpl());
  injector.registerLazySingleton<TypeRepository>(() => TypeRepositoryImpl());

  //viewmodels
  injector.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
  injector.registerLazySingleton<PokemonListViewModel>(() => PokemonListViewModel());
  injector.registerLazySingleton<TypesListViewModel>(() => TypesListViewModel());
}