import 'package:archi_app/core/models/Pokemon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokemonView extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonView(this.pokemon, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 0.0,
        ),
        backgroundColor: Colors.red,
        body: Stack(children: [
          Column(
            children: [
              Container(
                color: Colors.red,
                height: MediaQuery.of(context).size.height / 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(pokemon.name.toUpperCase(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                      SizedBox(height: 25),
                      Text("Height: ${pokemon.height / 10}m", style: TextStyle(color: Colors.white), textAlign: TextAlign.start),
                      Text("Weight: ${pokemon.weight / 10}Kg", style: TextStyle(color: Colors.white), textAlign: TextAlign.start),
                      Text("Type: ${pokemon.types.map((element) => element.type.name)}", style: TextStyle(color: Colors.white), textAlign: TextAlign.start),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        boxShadow: [
                      BoxShadow(color: Colors.black, spreadRadius: 1)
                    ])),
              )
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 - 50,
            left: MediaQuery.of(context).size.width / 2 - 50,
            child: Container(
              height: 100,
              width: 100,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                child: Image.network(pokemon.sprites.frontDefault),
              ),
            ),
          )
        ]),
      );
}
