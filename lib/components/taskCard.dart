
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:taskapp/controller/task.dart';
import 'package:taskapp/utils/appTheme.dart';

import '../model/taskModel.dart';
import '../view/taskpage.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
    required this.task,
    required this.number,
  }) : super(key: key);
  final Task task;
  final int number;
  @override
  Widget build(BuildContext context) {
    final TaskController controller = Get.find();
    return Column(
      children: [
        InkWell(
          onTap: () {
            controller.task.value.title = task.title;
            controller.task.value.description = task.description;
            controller.task.value.id = task.id;
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TaskPage(
                        title: "Edit Task",index: number,
                      )),
            );
          },
          child: Container(
            width: double.infinity,
            height: 12.h,
            decoration: BoxDecoration(color: AppTheme().white),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
              child: ListTile(
                leading: CircleAvatar(
                    backgroundColor: AppTheme().primary,
                    child: Text('${number + 1}')),
                title: SizedBox(
                    width: 60.w,
                    child: Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme().primaryStyle(13.sp),
                    )),
                subtitle: SizedBox(
                    width: 100.w,
                    child: Text(
                      task.description,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme().hintStyle(12.sp),
                    )),
                trailing: PopupMenuButton(
                  onSelected: (value) {
                    if (value == "edit") {
                      controller.task.value = task;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TaskPage(title: "Edit Task",index: number,)),
                      );
                    } else if (value == "Delete") {
                      controller.deleteTask(task.id);
                    }
                  },
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                        value: "edit",
                        child: Text('Edit'),
                      ),
                      const PopupMenuItem(
                            value: 'Delete',
                            child: Text('Delete')
                      )
                    ];
                  },
                ),
              ),
            ),
          ),
        ),
        Divider(
          thickness: 0.5.h,
          height: 1.h,
          color: AppTheme().hint,
        )
      ],
    );
  }
}
