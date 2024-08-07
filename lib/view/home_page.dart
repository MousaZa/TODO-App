import 'package:codsoft_todo_app/controller/add_task_controller.dart';
import 'package:codsoft_todo_app/model/colors.dart';
import 'package:codsoft_todo_app/view/task_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_task_sheet.dart';
import 'archive_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
         showModalBottomSheet(
             isScrollControlled: true,
             context: context,
             builder: (context)=>Padding(
               padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
               child: addTaskSheet(),
             )
         );
        },
        isExtended: true,
        backgroundColor: AppColors.secondary,
        label: Row(
          children: [
            Icon(
              Icons.add,
              color: AppColors.white,
            ),
            const SizedBox(width: 8),
            Text(
             "Add Task",
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
        IconButton(
            onPressed: (){
              Get.to(()=> const ArchivePage());
            },
            icon: Icon(
              Icons.archive_outlined,
              color: AppColors.secondary,
            ),
          ),
        ],
        backgroundColor: AppColors.primary,
        title: Text(
            'Todo App',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color : AppColors.secondary
          )
        ),
      ),
      body: GetBuilder<MainController>(
        init: MainController(),
        builder: (controller)=> ListView.builder(
          shrinkWrap: true,
        itemCount: controller.tasks.length,
        itemBuilder: (context, index){
          return controller.tasks[index].isCompleted ? const SizedBox() : TaskCard(index: index, task: controller.tasks[index]);
        }),
      ),
    );
  }
}
