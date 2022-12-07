
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/bloc/todo_repository.dart';
import 'package:todo_application/bloc/todo_state.dart';
import 'package:todo_application/models/todo_item.dart';
part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {

  final ToDoRepository repository;



  TodoBloc(this.repository) : super(TodoLoadingState()) {
    repository.notifyOnChange().listen((event) => add(TodoListUpdatedEvent()));

    on<AddTodoEvent>((event, emit){
      repository.addTodo(Todo(event.text, false));
    });

    on<TodoListUpdatedEvent>((event, emit) async {
      emit(TodoLoadingState());
      var items = await repository.getAllToDos();

      emit(TodoLoadedState(items));
    });

    on<ToggleTodoEvent>((event, emit) async {
      await repository.toggleTodo(event.todo, event.completed);
    });

    add(TodoListUpdatedEvent());
  }
}
