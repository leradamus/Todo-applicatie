import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_application/bloc/todo_state.dart';
import 'package:todo_application/todo_item.dart';

part 'todo_event.dart';

final _items = [
  ToDo(title: 'Item one!'),
  ToDo(title: 'Item two!')
];

class TodoBloc extends Bloc<TodoEvent, ToDoState> {
  TodoBloc() : super(ToDoState(items: _items)) {
    on<TodoEvent>((event, emit) {
      on<ToDoCompletedEvent>((event, emit){
        event.todo.isComplete = true;

        emit(ToDoState(items: _items));
      });
      on<ToDoUncompletedEvent>((event, emit){
        event.todo.isComplete = false;

        emit(ToDoState(items: _items));
      });
      on<TodoCreatedEvent>(((event, emit) {
        var todo = ToDo(title: event.title);

        state.items.add(todo);
        emit(ToDoState(items: state.items));
      }));
    });
  }
}
