import 'package:archi_app/core/injector/Injector.dart';
import 'package:archi_app/core/viewmodels/pokemonList/PokemonListViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'PokemonCard.dart';

class PokemonListView extends StatefulWidget {
  @override
  _PokemonListViewState createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  PokemonListViewModel _viewModel = injector.get<PokemonListViewModel>();

  @override
  void initState() {
    _viewModel.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PokemonListViewModel>(
        create: (context) => _viewModel,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _viewModel.title,
              style: TextStyle(fontSize: 22),
            ),
            Consumer<PokemonListViewModel>(
              builder: (context, model, _) {
                return Container(
                  height: 120,
                  child: NotificationListener<ScrollNotification>(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: model.pokemons.length,
                      itemBuilder: (_, position) =>
                          PokemonCard(pokemon: model.pokemons[position]),
                    ),
                    onNotification: (notification) {
                      if (notification.metrics.pixels ==
                          notification.metrics.maxScrollExtent) {
                        _viewModel.loadData();
                      }
                      return true;
                    }
                  ),
                );
              },
            )
          ],
        ));
  }
}
