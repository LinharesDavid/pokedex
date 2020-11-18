import 'dart:collection';

import 'package:archi_app/core/injector/Injector.dart';
import 'package:archi_app/core/models/TypeList.dart';
import 'package:archi_app/core/models/Type.dart';
import 'package:archi_app/core/repositories/TypeRepository.dart';
import 'package:flutter/material.dart';

class TypesListViewModel with ChangeNotifier {
  int _limit = 5;
  int _offset = 0;
  bool _isReset = true;
  List<PokemonType> _types = [];
  TypeList _typeList;
  TypeRepository _repository = injector.get<TypeRepository>();

  UnmodifiableListView<PokemonType> get types => UnmodifiableListView(_types);
  String get title => "Types";

  void loadData() async {
    _repository.get(_limit, _offset)
        .then((value) => _setTypeList(value));
    _offset += _limit;
  }

  void resetData() {
    _offset = 0;
    _isReset = true;
  }

  void _setTypeList(TypeList value) {
    _typeList = value;
    _fetchTypes(value);
  }

  void _fetchTypes(TypeList value) async {
    List<PokemonType> list = [];

    for (var result in value.results) {
      var type = await _repository.getType(result.name);
      list.add(type);
    }

    if (_isReset) {
      _types = list;
      _isReset = false;
    } else {
      _types.addAll(list);
    }

    notifyListeners();
  }
}