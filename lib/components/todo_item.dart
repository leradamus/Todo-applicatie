import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/models/todo.dart';
import '../bloc/todo_bloc.dart';

class TodoItem extends StatelessWidget {
  final Todo item;

  const TodoItem({Key? key, required this.item}) : super(key: key);

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
                value: item.complete,
                onChanged: (value) {
                  context.read<TodoBloc>().add(
                    ToggleTodoEvent(item, value ?? false),
                  );
                },
              ),
            ),
            Text(
              item.text,
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
