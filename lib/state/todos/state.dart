import 'package:flutter/foundation.dart';

class Todo {
  final int id;
  final String title;

  const Todo({required this.id, required this.title});

  factory Todo.fromJson(Map<String, dynamic> json) =>
      Todo(id: json['id'], title: json['title']);
}

class TodosState with ChangeNotifier {
  List<Todo> todos = [];
  bool loading = false;
  bool error = false;

  String search = '';

  void undoAddTodo() {
    todos.removeAt(0);

    notifyListeners();
  }

  void addTodo(Todo t) {
    todos.insert(0, t);
    search = '';

    notifyListeners();
  }

  void searchTodos(String s) {
    search = s;

    notifyListeners();
  }

  void request() {
    loading = true;
    error = false;

    notifyListeners();
  }

  void success(List<Todo> todos) {
    loading = false;
    error = false;
    this.todos = todos;

    notifyListeners();
  }

  void errorFn() {
    loading = false;
    error = true;

    notifyListeners();
  }
}
