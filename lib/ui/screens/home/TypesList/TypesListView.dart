import 'package:archi_app/core/injector/Injector.dart';
import 'package:archi_app/core/viewmodels/typesList/TypesListViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TypesListView extends StatefulWidget {
  @override
  _TypesListViewState createState() => _TypesListViewState();
}

class _TypesListViewState extends State<TypesListView> {
  TypesListViewModel _viewModel = injector.get<TypesListViewModel>();
  @override
  void initState() {
    _viewModel.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TypesListViewModel>(
        create: (context) => _viewModel,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _viewModel.title,
              style: TextStyle(fontSize: 22),
            ),
            Consumer<TypesListViewModel>(
              builder: (context, model, _) {
                return Container(
                  height: 120,
                  child: NotificationListener<ScrollNotification>(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: model.types.length,
                      itemBuilder: (_, position) =>
                          Container(
                            color: Colors.red,
                            height: 200,
                              child: Text(model.types[position].name))
                    ),
                    onNotification: (notification) {
                      if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                        _viewModel.loadData();
                      }
                      return true;
                    },
                  ),
                );
              },
            )
          ],
        ));
  }
}
