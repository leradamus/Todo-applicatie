import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/bloc/todo_bloc.dart';

class ToDoItem extends StatelessWidget {
  final ToDo toDoItem;

  const ToDoItem({super.key, required this.toDoItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        color: const Color(0x76ffffff),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Checkbox(
                value: toDoItem.isComplete,
                onChanged: (value){
                  if (value ?? false) {
                  BlocProvider.of<TodoBloc>(context)
                      .add(ToDoCompletedEvent(todo: toDoItem));
                } else {
                  BlocProvider.of<TodoBloc>(context)
                      .add(ToDoUncompletedEvent(todo: toDoItem));
                }
                },
              ),
            ),
            Text(
              toDoItem.title,
              style: const TextStyle(
                fontSize: 32,
                color: Colors.amber,
                fontFamily: 'DancingScript',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ToDo {
  String title;
  bool isComplete;

  ToDo({required this.title, this.isComplete = false});
}