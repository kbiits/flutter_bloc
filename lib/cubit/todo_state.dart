part of 'todo_cubit.dart';

@immutable
abstract class TodoState {}

class Todo {
  final num userId;
  final num id;
  final String title;
  final bool completed;
  Todo(
      {required this.id,
      required this.userId,
      required this.title,
      required this.completed});
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  Todo todo;
  TodoLoaded(this.todo);
}
