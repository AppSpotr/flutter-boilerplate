import 'package:boilerplate/state/todos/state.dart';

_selectFilteredTodos(List<Todo> todos, String search) => todos
    .where(
      (element) => element.title.toLowerCase().contains(search.toLowerCase()),
    )
    .toList();

selectFilteredTodos(TodosState todos) =>
    _selectFilteredTodos(todos.todos, todos.search);
