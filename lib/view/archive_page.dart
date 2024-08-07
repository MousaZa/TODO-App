import 'package:codsoft_todo_app/view/task_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controller/add_task_controller.dart';
import '../model/colors.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Archive',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.secondary,
          ),
        ),
      ),
      body: GetBuilder<MainController>(
        init: MainController(),
        builder: (controller)=> ListView.builder(
            shrinkWrap: true,
            itemCount: controller.tasks.length,
            itemBuilder: (context, index){
              return !(controller.tasks[index].isCompleted) ? const SizedBox() : TaskCard(index: index, task: controller.tasks[index]);
            }),
      ),
    );
  }
}
