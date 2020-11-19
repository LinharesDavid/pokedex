import 'package:archi_app/ui/screens/home/SearchBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PokemonList/PokemonListView.dart';
import 'itemList/ItemsListView.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Pokedex")),
    body: Column(
      children: [
        SearchBar(),
        PokemonListView(),
        ItemsListView()
      ],
    ),
  );
}
