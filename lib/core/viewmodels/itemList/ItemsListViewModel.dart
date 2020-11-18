import 'dart:collection';

import 'package:archi_app/core/injector/Injector.dart';
import 'package:archi_app/core/models/Item.dart';
import 'package:archi_app/core/models/ItemList.dart';
import 'package:archi_app/core/repositories/ItemRepository.dart';
import 'package:archi_app/core/viewmodels/DataListViewModel.dart';

class ItemsListViewModel extends DataListViewModel {
  List<Item> _items = [];
  ItemList _itemList;
  String get title => "Items";
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
  ItemRepository _repository = injector.get<ItemRepository>();

  ItemsListViewModel() {
    loadData();
  }

  void loadData() {
    _repository.get(limit, offset).then((value) => _setItemList(value));
    offset += limit;
  }
  
  void _setItemList(value) {
    _itemList = value;
    _fetchItems(value);
  }

  Future<void> _fetchItems(value) async {
    List<Item> list = [];

    for (var result in _itemList.items) {
      var item = await _repository.getItem(result.name);
      list.add(item);
    }

    if (isReset) {
      _items = list;
      isReset = false;
    } else {
      _items.addAll(list);
    }

    notifyListeners();
  }
}