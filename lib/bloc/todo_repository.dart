import 'package:isar/isar.dart';
import 'package:todo_application/models/todo.dart';

class ToDoRepository {
  late Isar _database;

  ToDoRepository() {
    _database = Isar.openSync([TodoSchema]);
  }

  Stream<void> notifyOnChange() => _database.todos.watchLazy();

  Future<List<Todo>> getAllToDos() => _database.todos.where().findAll();

  Future toggleTodo(Todo todo, bool completed) async {
    await _database.writeTxn(() {
      return _database.todos
          .put(Todo.createWithId(todo.id, todo.text, completed));
    });
  }

  Future addTodo(Todo todo) async {
    await _database.writeTxn(() => _database.todos.put(todo));
  }
}
