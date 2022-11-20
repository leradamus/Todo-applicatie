import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_application/todo_list.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero1',
      child: ToDoList(),
    );
  }
}


