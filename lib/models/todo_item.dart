import 'package:isar/isar.dart';
part 'todo_item.g.dart';


@Collection()
class Todo {
  Id id = Isar.autoIncrement;
  final String text;
  final bool complete;

  Todo.createWithId(this.id, this.text, this.complete);
  Todo(this.text, this.complete);
}