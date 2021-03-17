import 'package:flutter_test/flutter_test.dart';
import 'package:todo_with_redux/models/todo.dart';
import 'package:todo_with_redux/redux/actions/actions.dart';
import 'package:todo_with_redux/redux/reducers/app_reducer.dart';

void main() {
  test('Add todo item test', () {
    List<TodoItem> state = todoItemReducer(
        [], AddTodoAction(item: TodoItem(title: '123', content: 'abc')));
    expect(state.length, 1);
  });

  test('Remove todo item test', () {
    List<TodoItem> state = todoItemReducer([
      TodoItem(
          id: 0, title: 'Workout', content: 'Do 10 push up', isCompleted: true),
      TodoItem(id: 1, title: 'Running', content: 'Run 5km', isCompleted: false),
      TodoItem(
          id: 2,
          title: 'Read book',
          content: 'Read next chapter',
          isCompleted: true),
    ], RemoveItemAction(id: 0));
    expect(state.length, 2);
  });
  test('Toggle complete todo item test', () {
    List<TodoItem> state = todoItemReducer([
      TodoItem(
          id: 0, title: 'Workout', content: 'Do 10 push up', isCompleted: true),
      TodoItem(id: 1, title: 'Running', content: 'Run 5km', isCompleted: false),
      TodoItem(
          id: 2,
          title: 'Read book',
          content: 'Read next chapter',
          isCompleted: true),
    ], ToggleTodoAction(id: 0));
    expect(state[0].isCompleted, false);
  });

  test('Change index bottom menu test', () {
    int state = indexBottomMenuReducer(0, ChangeIndexTabAction(index: 2));
    expect(state, 2);
  });
}
