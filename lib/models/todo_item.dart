import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:todo_application/bloc/todo_bloc.dart';
import 'package:todo_application/bloc/todo_state.dart';

part 'todo_item.g.dart';


@Collection()
class Todo {
  Id id = Isar.autoIncrement;
  final String text;
  final bool complete;

  Todo.createWithId(this.id, this.text, this.complete);
  Todo(this.text, this.complete);
}