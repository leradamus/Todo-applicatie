import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/bloc/todo_state.dart';
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
  return ListView.builder(
      itemBuilder:(context, index){
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            color: const Color(0x76ffffff),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Checkbox(
                    value: state.items[index].complete,
                    onChanged: (value){
                      context.read<TodoBloc>().add(ToggleTodoEvent(state.items[index], value ?? false));
                    },
                  ),
                ),
                Text(
                  state.items[index].text,
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
      },
    itemCount: state.items.length,
  );
}
