import 'dart:convert';

import 'package:boilerplate/state/todos/state.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

class TodosService {
  Future<List<Todo>> fetch() async {
    final response = await http.get(Uri.parse(dotenv.get('LIST_EXAMPLE_API')));

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch todos');
    }

    final List<dynamic> rawTodos = jsonDecode(response.body);

    return List<Todo>.from(rawTodos.map((e) => Todo.fromJson(e)));
  }
}
