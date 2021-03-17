import 'package:todo_with_redux/models/todo.dart';
import 'package:todo_with_redux/redux/states/tab_state.dart';

class AppState {
  List<TodoItem> allItems = List<TodoItem>();
  int tabIndex = 0;

  AppState({this.allItems, this.tabIndex});

  factory AppState.initial() {
    return AppState(
      allItems: [
        TodoItem(
            id: 0,
            title: 'Workout',
            content: 'Do 10 push up',
            isCompleted: true),
        TodoItem(
            id: 1, title: 'Running', content: 'Run 5km', isCompleted: false),
        TodoItem(
            id: 2,
            title: 'Read book',
            content: 'Read next chapter',
            isCompleted: true),
      ],
      tabIndex: TabState.initial().currentIndex,
    );
  }
}
