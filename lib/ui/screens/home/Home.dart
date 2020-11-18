import 'package:archi_app/core/viewmodels/home/HomeViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => HomeViewModel(),
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
        ),
      ),
    );
  }
}
