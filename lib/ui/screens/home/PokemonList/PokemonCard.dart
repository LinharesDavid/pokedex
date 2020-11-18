import 'package:archi_app/core/models/Pokemon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final Item pokemon;

  const PokemonCard({Key key, @required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 75,
            child: Container(
              height: 120,
              width: 300,
              child: Card(
                shadowColor: Colors.blueAccent,
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.only(right: 37.5, top: 8.0),
                  child: Column(
                    children: [
                      Text(pokemon.name.toUpperCase(), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 15),
                      Text("Height: ${pokemon.height / 10}m", textAlign: TextAlign.center),
                      Text("Weight: ${pokemon.weight / 10}Kg", textAlign: TextAlign.center),
                      Text("Type: ${pokemon.types.map((element) => element.type.name)}", textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Card(
              shadowColor: Colors.blueAccent,
              elevation: 1,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              child: Image.network(pokemon.sprites.frontDefault),
            ),
          )
        ],
      ),
    );
  }
}