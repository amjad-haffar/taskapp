import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:taskapp/components/button.dart';
import 'package:taskapp/components/textField.dart';
import 'package:taskapp/utils/appTheme.dart';
import '../controller/task.dart';

class TaskPage extends StatelessWidget {
  TaskPage({Key? key, required this.title, required this.index})
      : super(key: key);
  final TaskController controller = Get.put(TaskController());
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController descriptionCont = TextEditingController();
  final String title;
  final int index;
  void submitData() {
    if (nameCont.text != "" && descriptionCont.text != "") {
      controller.task.value.title = nameCont.text;
      controller.task.value.description = descriptionCont.text;
      if (title == 'Edit Task') {
        controller.updateTask(
          controller.task.value.id,index
        );
        Get.back();
      } else {
        controller.addTask();
        Get.back();
      }
    } else {
      Get.snackbar(
        'Error',
        'you should fill all information',
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final TaskController controller = Get.find();
    nameCont.text = controller.task.value.title;
    descriptionCont.text = controller.task.value.description;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: AppTheme().primary,
      ),
      body: Column(children: [
        TextfieldCustom(
            controller: nameCont,
            text: "Task Name",
            hint: "Task Title",
            type: TextInputType.text),
        TextfieldCustom(
            controller: descriptionCont,
            text: "Task Description",
            hint: "type task details ...",
            type: TextInputType.text,
            lines: 3),
        AppTheme().addVerBox(3.h),
        InkWell(
          onTap: () => submitData(),
          child: Button(
              text: "Submit",
              backColor: AppTheme().primary,
              fontColor: AppTheme().white,
              width: 28.w),
        )
      ]),
    );
  }
}
