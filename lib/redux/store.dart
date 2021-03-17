import 'package:redux/redux.dart';
import 'package:todo_with_redux/redux/reducers/app_reducer.dart';
import 'package:todo_with_redux/redux/states/app_state.dart';

class Redux {
  static final Store<AppState> _store = Store<AppState>(
    appReducer,
    initialState: new AppState.initial(),
  );

  static Store<AppState> get store => _store;
}
