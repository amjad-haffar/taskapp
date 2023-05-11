import 'package:taskapp/model/model.dart';

class Task extends Model {
  Task(
      {required this.title,
      required this.description,
      required this.completed,
      this.id = ""});
  late String title;
  late String description;
  late bool completed;
  late String id;

  @override
  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        completed: json["is_completed"],
      );
  @override
  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "is_completed": completed,
      };
}
