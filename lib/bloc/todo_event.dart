part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class ToDoCompletedEvent extends TodoEvent{
  final ToDo todo;

  ToDoCompletedEvent({required this.todo});
}

class ToDoUncompletedEvent extends TodoEvent{
  final ToDo todo;

  ToDoUncompletedEvent({required this.todo});
}

class TodoCreatedEvent extends TodoEvent {
  final String title;

  TodoCreatedEvent({required this.title});
}