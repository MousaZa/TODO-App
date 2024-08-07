import 'dart:convert';

import 'package:codsoft_todo_app/model/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> storeTasks(List<Task> tasks) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> stringTasks =
      tasks.map((task) => jsonEncode(task.toMap())).toList();
  await prefs.setStringList('tasks', stringTasks);
}

Future<List<Task>> retrieveTasks() async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? stringTasks = prefs.getStringList('tasks');
  if (stringTasks == null) return [];
  return stringTasks.map((task) => Task.fromMap(jsonDecode(task))).toList();
}
