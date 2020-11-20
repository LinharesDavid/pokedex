import 'package:archi_app/core/injector/Injector.dart';
import 'package:archi_app/core/viewmodels/home/PokemonHomeViewModel.dart';
import 'package:archi_app/ui/screens/pokemon/PokemonList/PokemonListView.dart';
import 'package:archi_app/ui/screens/pokemon/PokemonList/itemList/ItemsListView.dart';
import 'package:archi_app/ui/shared/menu/Menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PokemonHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(injector.get<PokemonHomeViewModel>().title)),
    drawer: Menu(),
    body: Column(
      children: [
        PokemonListView(),
        ItemsListView()
      ],
    ),
  );
}
