import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo_with_redux/models/todo.dart';
import 'package:todo_with_redux/redux/actions/actions.dart';
import 'package:todo_with_redux/redux/states/app_state.dart';

class TodoList extends StatelessWidget {
  final List<TodoItem> todos;
  TodoList({
    @required this.todos,
  });

  List<Widget> _buildListItems(BuildContext context) {
    return todos
        .map((todo) => ListTile(
            leading: todo.isCompleted
                ? IconButton(
                    icon: Icon(Icons.check_box_rounded, color: Colors.blue),
                    onPressed: () {
                      StoreProvider.of<AppState>(context)
                          .dispatch(ToggleTodoAction(id: todo.id));
                    })
                : IconButton(
                    icon: Icon(
                      Icons.check_box_outline_blank_rounded,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      StoreProvider.of<AppState>(context)
                          .dispatch(ToggleTodoAction(id: todo.id));
                    }),
            title: Text(todo.title),
            subtitle: Text(todo.content),
            trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  StoreProvider.of<AppState>(context)
                      .dispatch(RemoveItemAction(id: todo.id));
                })))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: new Column(
        children: _buildListItems(context),
      ),
    );
  }
}
