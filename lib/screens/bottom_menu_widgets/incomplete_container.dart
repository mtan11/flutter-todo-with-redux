import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo_with_redux/models/todo.dart';
import 'package:todo_with_redux/redux/states/app_state.dart';
import 'package:todo_with_redux/widgets/todo_list.dart';

class IncompleteContaienr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, List<TodoItem>>(
      distinct: true,
      converter: (store) => store.state.allItems
          .where((element) => !element.isCompleted)
          .toList(),
      builder: (context, List<TodoItem> todoItems) => todoItems.length == 0
          ? Center(
              child: Text(
                'Nothing to do!',
                style: Theme.of(context).textTheme.headline5,
              ),
            )
          : new TodoList(todos: todoItems),
    );
  }
}
