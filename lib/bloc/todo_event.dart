part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class TodoListUpdatedEvent extends TodoEvent {}

class AddTodoEvent extends TodoEvent{
  final String text;
  AddTodoEvent(this.text);
}

class ToggleTodoEvent extends TodoEvent{
  final Todo todo;
  final bool completed;

  ToggleTodoEvent(this.todo, this.completed);
}
/*

class ToDoCompletedEvent extends TodoEvent{
  final Todo todo;

  ToDoCompletedEvent({required this.todo});
}

class ToDoUncompletedEvent extends TodoEvent{
  final Todo todo;

  ToDoUncompletedEvent({required this.todo});
}

class TodoCreatedEvent extends TodoEvent {
  final String title;

  TodoCreatedEvent({required this.title});
}
*/
