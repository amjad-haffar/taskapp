import 'package:get/get.dart';

import '../API/apiURL.dart';
import '../API/requestType.dart';
import '../model/taskModel.dart';

class TaskController extends GetxController {
  Rx<Task> task = Task(title: '', description: '', completed: false).obs;
  RxList<Task> data = <Task>[].obs;
  RxBool isLoading = true.obs;
  addTask() async {
    String id =
        await Request.createModel(task.value, ApiName.name(apis.postTask));
    task.value.id = id;
    data.add(task.value);
  }

  deleteTask(String id) async {
    bool deleted = await Request.deleteModelByID(
      ApiName.name(apis.deleteTask) + id,
    );
    if (deleted) {
      data.removeWhere((element) => element.id == id);
      data.refresh();
    }
  }

  updateTask(String id, int index) async {
  
    bool updated = await Request.updateModel(
        task.value, ApiName.name(apis.updateTask) + id);
    // data.firstWhere((item) => item.id == id);
    if (updated) {
      // print("taskid ");
      // print(task.value.id);
      // int x = data.indexWhere((element) => element.id == id);
      // print("index is ={$x}");
      // data[index] = task.value;
      // print("index is ={}");
      await getAllTasks();
      // data.refresh();
    }
  }

  getAllTasks() async {
    isLoading.value = true;
    // update();
    data.value = await Request.getAllModel<Task>(
        ApiName.name(apis.getTask), (json) => Task.fromJson(json));
    isLoading.value = false;
    // update();
  }

  @override
  void onInit() async {
    await getAllTasks();
    super.onInit();
  }
}
