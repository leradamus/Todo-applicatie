import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/bloc/todo_state.dart';
import 'package:todo_application/components/todo_item.dart';
import 'package:todo_application/components/create_todo.dart';
import '../bloc/todo_bloc.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoLoadedState) {
          return Column(
            children: [
              const CreateToDoItem(),
              _todoItemsLoaded(context, state)
            ],
          );
        }
        return _todoItemsLoading(context);
      },
    );
  }
}

Widget _todoItemsLoading(BuildContext context) {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget _todoItemsLoaded(BuildContext context, TodoLoadedState state) {
  return Expanded(
    child: ListView.builder(
      itemBuilder: (context, index) {
        return TodoItem(item: state.items[index]);
      },
      itemCount: state.items.length,
    ),
  );
}
