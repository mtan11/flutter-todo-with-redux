import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_with_redux/models/todo.dart';
import 'package:todo_with_redux/redux/store.dart';
import 'package:todo_with_redux/screens/home.dart';

import 'redux/reducers/app_reducer.dart';
import 'redux/states/app_state.dart';

void main() {
  final Store<AppState> _store = Redux.store;
  runApp(MyApp(
    store: _store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp({this.store});
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
          title: 'TO DO APP',
          debugShowCheckedModeBanner: false,
          home: HomeScreen()),
    );
  }
}
