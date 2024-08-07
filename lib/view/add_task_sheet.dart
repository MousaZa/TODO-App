import 'package:codsoft_todo_app/controller/add_task_controller.dart';
import 'package:codsoft_todo_app/model/task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/colors.dart';
import '../model/icons.dart';


Widget addTaskSheet() {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  var controller = Get.put(MainController());
  return Container(
    // height: 300,
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 5,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              TextField(
                decoration:const InputDecoration(
                  hintText: 'Task Name',
                  border: OutlineInputBorder(),
                ),
                maxLength: 20,
                controller: taskNameController,
              ),
              const SizedBox(height: 20),
              TextField(
                decoration:const InputDecoration(
                  hintText: 'Task Description',
                  border: OutlineInputBorder(),
                ),
                maxLength: 100,
                controller: taskDescriptionController,
              ),
              const SizedBox(height: 20),
              GetBuilder<MainController>(
                init: MainController(),
                builder: (controller) => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: iconsList
                        .map((icon) => IconButton(
                              icon: Icon(icon),
                              onPressed: () {
                                controller.chooseIcon(icon) ;
                              },
                              color: controller.selectedIcon == icon
                                  ? AppColors.rDark
                                  : AppColors.black,
                            ))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: AppColors.secondary,
                  border: Border.all(color: AppColors.secondary),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MaterialButton(
                  onPressed: () {
                    controller.addTask(Task(
                      name: taskNameController.text,
                      description: taskDescriptionController.text,
                      icon: controller.selectedIcon,
                      isCompleted: false,
                    ));
                    taskNameController.clear();
                    taskDescriptionController.clear();
                    Get.back();
                  },
                  child: Text(
                      'Add Task',
                    style: TextStyle(
                        color: AppColors.secondary,
                      ),
                  ),
                ),
              ),
              const SizedBox(height: 20)
            ])),
      ],
    ),
  );
}
