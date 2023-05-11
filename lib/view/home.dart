import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:taskapp/controller/task.dart';
import 'package:taskapp/utils/appTheme.dart';
import 'package:taskapp/view/taskpage.dart';

import '../components/taskCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TaskController controller = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks List'),
        backgroundColor: AppTheme().primary,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.task.value.title = "";
          controller.task.value.description = "";
          controller.task.value.id = "";
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TaskPage(title: "Add New Task",index: 0,)),
          );
        },
        label: const Text("Add Task"),
        backgroundColor: AppTheme().primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => controller.isLoading.value
                  ? SpinKitCircle(
                      color: AppTheme().primary,
                      size: 4.w,
                    )
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, index) =>
                          TaskCard(number: index, task: controller.data[index]),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
