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

  void searchTodos(String s) {
    search = s;

    update();
  }

  void request() {
    loading = true;
    error = false;

    update();
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

    update();
  }

  void update() {
    notifyListeners();
  }
}
