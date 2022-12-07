import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:todo_application/bloc/todo_bloc.dart';
import 'package:todo_application/bloc/todo_state.dart';

part 'todo_item.g.dart';

class TodoItem extends StatelessWidget {
  final TodoLoadedState state;
  final BuildContext context;

  const TodoItem(this.state, this.context, {super.key})

  @override
  Widget build() {
    return ListView.builder(itemBuilder: (context, index){
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
    });
  }
}

@Collection()
class Todo {
  Id id = Isar.autoIncrement;
  final String text;
  final bool complete;

  Todo.createWithId(this.id, this.text, this.complete);
  Todo(this.text, this.complete);
}