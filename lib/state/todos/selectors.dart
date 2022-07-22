import 'package:boilerplate/state/todos/state.dart';
import 'package:memoized/memoized.dart';

final _selectFilteredTodos =
    Memoized2((List<Todo> todos, String search) => todos
        .where(
          (element) =>
              element.title.toLowerCase().contains(search.toLowerCase()),
        )
        .toList());

selectFilteredTodos(TodosState todos) =>
    _selectFilteredTodos(todos.todos, todos.search);
