import 'package:boilerplate/services/services.dart';
import 'package:boilerplate/state/todos/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final services = BoilerPlateServices();

class TodosActions {
  final BuildContext context;
  late TodosState todos;

  TodosActions({required this.context}) {
    todos = Provider.of<TodosState>(context, listen: false);
  }

  Future<void> fetch() async {
    try {
      todos.request();

      // request
      final t = await services.todos.fetch();

      todos.success(t);
    } catch (e) {
      todos.errorFn();
    }
  }
}
