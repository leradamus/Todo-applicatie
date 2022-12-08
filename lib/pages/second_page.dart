import 'package:flutter/material.dart';
import 'package:todo_application/components/todo_list.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Hero(
      tag: 'hero1',
      child: TodoList(),
    );
  }
}
