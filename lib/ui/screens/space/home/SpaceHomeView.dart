import 'package:archi_app/core/injector/Injector.dart';
import 'package:archi_app/core/models/MarsRoverPhotos.dart';
import 'package:archi_app/core/viewmodels/MarsRoverPhotosViewModel.dart';
import 'package:archi_app/ui/shared/menu/Menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpaceHomeView extends StatelessWidget {
  final _viewModel = injector.get<MarsRoverPhotosViewModel>();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(),
      drawer: Menu(),
      body: ChangeNotifierProvider<MarsRoverPhotosViewModel>(
        create: (context) => _viewModel,
        child: Stack(children: [
          FutureBuilder<MarsRoverPhotos>(
            future: _viewModel.fetchNextData(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.done) {
                if (snap.hasData) {
                  return Consumer<MarsRoverPhotosViewModel>(
                    builder: (context, model, _) =>
                        NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification.metrics.pixels ==
                            notification.metrics.maxScrollExtent) {
                          _viewModel.fetchNextData();
                        }
                        return true;
                      },
                      child: ListView.builder(
                          itemCount: _viewModel.photos.length,
                          itemBuilder: (context, index) {
                            print(_viewModel.photos[index].imgSrc);
                            return Image.network(
                              _viewModel.photos[index].imgSrc,
                              height: 100,
                              width: 100,
                            );
                          }),
                    ),
                  );
                }
              }
              return SizedBox();
            },
          ),
          Consumer<MarsRoverPhotosViewModel>(
            builder: (context, model, _) => model.fetching
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: CircularProgressIndicator(),
                  )
                : SizedBox(),
          )
        ]),
      ));
}
