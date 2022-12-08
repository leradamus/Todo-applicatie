import 'package:flutter/cupertino.dart';

import '../models/todo.dart';

@immutable
class TodoState {}

class TodoLoadingState extends TodoState {}

class TodoLoadedState extends TodoState {
  final List<Todo> items;

  TodoLoadedState(this.items);
}
