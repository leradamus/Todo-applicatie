import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/bloc/todo_state.dart';
import 'package:todo_application/models/create_todo.dart';
import 'package:todo_application/models/todo_item.dart';

import '../bloc/todo_bloc.dart';

class TodoList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if(state is TodoLoadedState){
          return _todoItemsLoaded(context, state);
        }
        return _todoItemsLoading(context);
      },
    );
  }
}

Widget _todoItemsLoading(BuildContext context){
  return const Center(
    child: CircularProgressIndicator(),
  );
}


Widget _todoItemsLoaded(BuildContext context, TodoLoadedState state){
  return const TodoItem(state);
}
