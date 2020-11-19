import 'package:archi_app/core/injector/Injector.dart';
import 'package:archi_app/core/viewmodels/itemList/ItemsListViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'ItemCard.dart';

class ItemsListView extends StatelessWidget {
  final _viewModel = injector.get<ItemsListViewModel>();

  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider<ItemsListViewModel>(
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
                child: Consumer<ItemsListViewModel>(
                  builder: (context, model, _) {
                    return Container(
                      height: 120,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: model.items.length,
                        itemBuilder: (_, position) {
                          if (position > model.items.length / 2) {
                            model.loadData();
                          }
                          return ItemCard(item: model.items[position]);
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          )
      );
}
