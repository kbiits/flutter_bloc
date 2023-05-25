import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  void loadTodo() async {
    emit(TodoLoading());
    var response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/todos/1"));
    var data = jsonDecode(response.body);
    var todo = Todo(
        id: data['id'],
        userId: data['userId'],
        title: data['title'],
        completed: data['completed']);
    emit(TodoLoaded(todo));
  }

  void makeTodoInitial() async {
    emit(TodoInitial());
  }
}
