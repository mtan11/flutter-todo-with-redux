import 'package:todo_with_redux/models/todo.dart';
import 'package:todo_with_redux/redux/actions/actions.dart';
import 'package:todo_with_redux/redux/states/app_state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
      allItems: todoItemReducer(state.allItems, action),
      tabIndex: indexBottomMenuReducer(state.tabIndex, action));
}

List<TodoItem> todoItemReducer(List<TodoItem> state, action) {
  if (action is AddTodoAction) {
    return []
      ..addAll(state)
      ..add(TodoItem(
          id: state.length++,
          title: action.item.title,
          content: action.item.content,
          isCompleted: false));
  }

  if (action is RemoveItemAction) {
    return List.unmodifiable(
        List.from(state)..removeWhere((item) => item.id == action.id));
  }

  if (action is ToggleTodoAction) {
    return state
        .map((TodoItem todo) => todo.id == action.id
            ? todo.copyWith(isCompleted: !todo.isCompleted)
            : todo)
        .toList();
  }

  return state;
}

int indexBottomMenuReducer(int state, action) {
  if (action is ChangeIndexTabAction) {
    return action.index;
  }
  return state;
}
