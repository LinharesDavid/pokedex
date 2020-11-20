import 'dart:collection';

import 'package:archi_app/core/injector/Injector.dart';
import 'package:archi_app/core/models/MarsRoverPhotos.dart';
import 'package:archi_app/core/repositories/MarsRoverRepository.dart';
import 'package:archi_app/core/repositories/NasaBaseRepository.dart';
import 'package:flutter/material.dart';

class MarsRoverPhotosViewModel with ChangeNotifier {
  MarsRoverPhotos _marsRoverPhotos;
  MarsRoverPhotos get marsRoverPhotos => _marsRoverPhotos;
  List<Photo> _photos = [];
  bool _fetching = false;
  bool get fetching => _fetching;
  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);
  MarsRoverPhotosRepository _repository = injector.get<MarsRoverPhotosRepository>();
  int _currentPage = 0;
  int get currentPage => _currentPage;  

  Future<MarsRoverPhotos> fetchNextData() async {
    _setFetching(true);
    this._marsRoverPhotos = await _repository.get(NasaBaseRepository.apiKey, page: _currentPage++, sol: 1000);
    _setFetching(false);
    _photos.addAll(_marsRoverPhotos.photos);
    notifyListeners();
    return marsRoverPhotos;
  }

  void _setFetching(bool bool) {
    _fetching = bool;
  }
}