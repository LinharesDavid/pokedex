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
        appBar: AppBar(
            flexibleSpace: Padding(
              padding: EdgeInsets.only(top: 24, right: 8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                ),
              ),
            ),
            bottom: PreferredSize(
              child: Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 24),
                  child: Align(
                      child: Text("Pokedex".toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          )),
                      alignment: Alignment.topLeft)),
              preferredSize: Size.fromHeight(70),
            )),
        drawer: Menu(),
        body: Column(
          children: [PokemonListView(), ItemsListView()],
        ),
      );
}
