import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/bloc/todo_state.dart';
import 'package:todo_application/create_todo.dart';
import 'package:todo_application/todo_item.dart';

import 'bloc/todo_bloc.dart';

class ToDoList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, ToDoState>(
      builder: (context, state) {
        return Column(
          children: [
            // Empty field to create new todo
            CreateToDoItem(),
            // list of todo items
            Expanded(
              child: ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, index) => ToDoItem(
                  toDoItem: state.items[index],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}