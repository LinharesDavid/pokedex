import 'package:flutter/cupertino.dart';

class DataListViewModel with ChangeNotifier {
  int limit = 5;
  int offset = 0;
  bool isReset = true;

  void resetData() {
    offset = 0;
    isReset = true;
  }
}