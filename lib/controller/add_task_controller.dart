import 'package:codsoft_todo_app/model/deal_with_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/icons.dart';
import '../model/task.dart';

class MainController extends GetxController{
  List<Task> tasks = [];

  @override
  void onInit() async {
    super.onInit();
    tasks = await retrieveTasks();
    update();
  }

  IconData selectedIcon = iconsList[0];

  void addTask(Task task){
    tasks.add(task);
    storeTasks(tasks);
    update();
  }
  void editTask(Task task, int index){
    tasks[index] = task;
    storeTasks(tasks);
    update();
  }

  void restoreTask(Task task){
    task.isCompleted = false;
    storeTasks(tasks);
    update();
  }

  void deleteTask(Task task){
    tasks.remove(task);
    storeTasks(tasks);
    update();
  }

  void archiveTask(Task task){
    task.isCompleted = true ;
    storeTasks(tasks);
    update();
  }

  void chooseIcon(IconData icon){
    selectedIcon = icon;
    update();
  }

}