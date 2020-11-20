import 'package:archi_app/core/injector/Injector.dart';
import 'package:archi_app/core/viewmodels/pokemonList/PokemonListViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'PokemonCard.dart';

class PokemonListView extends StatelessWidget {
  final _viewModel = injector.get<PokemonListViewModel>();
  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider<PokemonListViewModel>(
          create: (context) => _viewModel,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _viewModel.title,
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Consumer<PokemonListViewModel>(
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
                          }),
                    );
                  },
                ),
              )
            ],
          ));
}
