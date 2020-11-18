import 'package:archi_app/core/repositories/ItemRepository.dart';
import 'package:archi_app/core/repositories/PokemonRepository.dart';
import 'package:archi_app/core/viewmodels/home/HomeViewModel.dart';
import 'package:archi_app/core/viewmodels/itemList/ItemsListViewModel.dart';
import 'package:archi_app/core/viewmodels/pokemonList/PokemonListViewModel.dart';
import 'package:get_it/get_it.dart';

GetIt injector = GetIt.instance;

void setup() {
  // repositories
  injector.registerLazySingleton<PokemonRepository>(() => PokemonRepositoryImpl());
  injector.registerLazySingleton<ItemRepository>(() => ItemRepositoryImpl());

  //viewmodels
  injector.registerFactory<HomeViewModel>(() => HomeViewModel());
  injector.registerFactory<PokemonListViewModel>(() => PokemonListViewModel());
  injector.registerFactory<ItemsListViewModel>(() => ItemsListViewModel());
}