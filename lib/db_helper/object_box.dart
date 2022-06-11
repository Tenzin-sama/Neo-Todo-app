import 'package:neo_todo/models/todo.dart';
import 'package:neo_todo/objectbox.g.dart';

class ObjectBox {
  late final Store _store;
  late final Box<Todo> _todoBox;

  ObjectBox._init(this._store) {
    _todoBox = Box<Todo>(_store);
  }

  static Future<ObjectBox> init() async {
    final store = await openStore();
    return ObjectBox._init(store);
  }

  Todo? getTask(int id) => _todoBox.get(id);

  List<Todo> getTasks() => _todoBox.getAll();

  int addTask(Todo todo) => _todoBox.put(todo);

  bool deleteTask(int id) => _todoBox.remove(id);
}
