import 'package:archi_app/core/viewmodels/home/PokemonHomeViewModel.dart';
import 'package:archi_app/ui/screens/home/PokemonHome.dart';
import 'package:archi_app/ui/screens/space/home/SpaceHomeView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
        elevation: 16.0,
        child: Container(
          color: Colors.blueGrey,
          child: Column(
            children: [
              SizedBox(height: 60),
              ListTile(
                onTap: () => _goToView(PokemonHomeView(), context),
                title: Text("Pokemons", style: TextStyle(color: Colors.white)),
                leading: Icon(
                  Icons.apps_sharp,
                  color: Colors.white,
                ),
              ),
              ListTile(
                onTap: () => _goToView(SpaceHomeView(), context),
                title: Text("Space", style: TextStyle(color: Colors.white)),
                leading: Icon(
                  Icons.star_border,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      );

  void _goToView(Widget view, BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => view));
  }
}
