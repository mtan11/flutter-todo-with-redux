import 'package:flutter/material.dart';
import 'package:todo_with_redux/models/todo.dart';

class AddTodoAction {
  final TodoItem item;

  AddTodoAction({@required this.item});
}

class RemoveItemAction {
  final int id;

  RemoveItemAction({@required this.id});
}

class ToggleTodoAction {
  final int id;
  ToggleTodoAction({@required this.id});
}

class ChangeIndexTabAction {
  const ChangeIndexTabAction({@required this.index});

  final int index;
}
