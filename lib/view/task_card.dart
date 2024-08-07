import 'package:codsoft_todo_app/model/task.dart';
import 'package:codsoft_todo_app/view/edit_task_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../controller/add_task_controller.dart';
import '../model/colors.dart';

class TaskCard extends StatelessWidget {
  final controller = Get.find<MainController>();
  TaskCard({super.key, required this.index, required this.task});
  final int index;
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(index),
      endActionPane: task.isCompleted
          ? ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              controller.restoreTask(task);
            },
            backgroundColor: AppColors.rDark,
            foregroundColor: Colors.white,
            icon: Icons.restore_outlined,
            // label: 'Delete',
          ),
        ],
      )
          : ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              controller.deleteTask(task);
            },
            backgroundColor: AppColors.rDark,
            foregroundColor: Colors.white,
            icon: Icons.delete_outline,
            // label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context) {
              controller.archiveTask(task);
            },
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.done_outline_rounded
            // label: 'Done',
          ),
          SlidableAction(
            onPressed: (context) {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context)=>Padding(
                    padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: editTaskSheet(task, index),
                  )
              );
            },
            backgroundColor: AppColors.secondary,
            foregroundColor: Colors.white,
            icon: Icons.edit_outlined,
            // label: 'Edit',
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          task.name,
          style: TextStyle(
            color: AppColors.secondary,
          ),
        ),
        subtitle: Text(
          task.description,
          style: TextStyle(
            color: AppColors.secondary,
          ),
        ),
        leading: Icon(
          task.icon,
          color: AppColors.secondary,
        ),
        trailing: Icon(
          Icons.arrow_back_outlined,
          color: AppColors.rLight,
        ),
      ),
    );
  }
}
