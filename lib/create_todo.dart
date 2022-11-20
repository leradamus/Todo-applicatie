

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/bloc/todo_bloc.dart';

class CreateToDoItem extends StatefulWidget {
  const CreateToDoItem({Key? key}) : super(key: key);

  @override
  State<CreateToDoItem> createState() => _CreateToDoItemState();
}

class _CreateToDoItemState extends State<CreateToDoItem> {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: TextField(
        controller: _controller,
        onSubmitted: (value) {
          _controller.clear();
          BlocProvider.of<TodoBloc>(context)
              .add(TodoCreatedEvent(title: value));
        },
      ),
    );
  }
}
