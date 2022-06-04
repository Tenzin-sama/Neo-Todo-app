import 'package:objectbox/objectbox.dart';

@Entity()
class Todo {
  int id;
  String title;
  int? difficultyLevel;
  bool? isCompleted;

  Todo({
    this.id = 0,
    required this.title,
    this.difficultyLevel = 1,
    this.isCompleted = false,
  });
}
