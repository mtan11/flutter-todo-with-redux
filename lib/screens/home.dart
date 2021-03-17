import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_with_redux/const/validator.dart';
import 'package:todo_with_redux/models/todo.dart';
import 'package:todo_with_redux/redux/actions/actions.dart';
import 'package:todo_with_redux/redux/states/app_state.dart';
import 'package:todo_with_redux/screens/bottom_menu_widgets/bottom_menu_widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final List<Widget> menu = [
    AllContainer(),
    CompleteContainer(),
    IncompleteContaienr()
  ];

  void _showDialogCreateTodo() async {
    await showDialog<String>(
      context: context,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: Form(
          key: _formKey,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            new TextFormField(
              autofocus: true,
              controller: titleController,
              validator: (value) => Validator.validateTitle(value),
              decoration: new InputDecoration(
                labelText: 'Title',
              ),
            ),
            new TextFormField(
              autofocus: true,
              maxLines: 3,
              controller: contentController,
              validator: (value) => Validator.validateContent(value),
              decoration: new InputDecoration(
                labelText: 'Content',
              ),
            ),
          ]),
        ),
        actions: <Widget>[
          new FlatButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              }),
          new FlatButton(
              child: const Text('Add'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  StoreProvider.of<AppState>(context).dispatch(AddTodoAction(
                      item: TodoItem(
                          title: titleController.text,
                          content: contentController.text)));
                  Navigator.pop(context);
                  clearForm();
                }
              })
        ],
      ),
    );
  }

  List<BottomNavigationBarItem> buildItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.menu),
        label: 'All',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.check),
        label: 'Complete',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.check_box_outline_blank_rounded),
        label: 'Incomplete',
      ),
    ];
  }

  void clearForm() {
    titleController.clear();
    contentController.clear();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
        converter: (store) => store.state.tabIndex,
        distinct: true,
        builder: (BuildContext context, tabIndex) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Todo App'),
              ),
              body: AnimatedSwitcher(
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ClipRect(
                    child: SlideTransition(
                      position: Tween<Offset>(
                              begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                          .animate(animation),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: child,
                      ),
                    ),
                  );
                },
                duration: Duration(milliseconds: 150),
                child: menu[tabIndex],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: _showDialogCreateTodo,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
              bottomNavigationBar: StoreBuilder(
                builder: (_, Store<AppState> store) {
                  return BottomNavigationBar(
                      currentIndex: tabIndex,
                      type: BottomNavigationBarType.fixed,
                      items: buildItems(),
                      onTap: (index) =>
                          store.dispatch(ChangeIndexTabAction(index: index)));
                },
              ));
        });
  }
}
