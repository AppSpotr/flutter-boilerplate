import 'package:boilerplate/state/todos/actions.dart';
import 'package:boilerplate/state/todos/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodosScreen();
}

class _TodosScreen extends State<TodosScreen> {
  late TodosActions todoActions = TodosActions(context: context);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // todoActions.fetch();
    });
  }

  Future<void> fetchItems() async {
    return;
  }

  @override
  Widget build(BuildContext context) => Consumer<TodosState>(
        builder: ((context, todos, child) => Scaffold(
              appBar: AppBar(
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: const Text('Todos'),
              ),
              body: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        child: Center(
                          child: Text('There are ${todos.todos.length} todos.'),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Center(
                      child: RefreshIndicator(
                        onRefresh: fetchItems,
                        child: ListView.builder(
                          itemCount: todos.todos.length,
                          itemBuilder: ((context, index) => SizedBox(
                                height: 40,
                                child:
                                    Text('title: ${todos.todos[index].title}'),
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      );
}
