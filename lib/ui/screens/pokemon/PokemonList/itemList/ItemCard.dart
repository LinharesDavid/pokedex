import 'package:archi_app/core/models/Item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
    shadowColor: Colors.deepOrange,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
    child: Image.network(item.sprites.spritesDefault),
  );
}
