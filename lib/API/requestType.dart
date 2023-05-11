import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:taskapp/API/request.dart';
import 'package:taskapp/model/model.dart';
import 'package:get/get.dart' as g;

typedef JsonDecoder<T> = Function(Map<String, dynamic> json);
typedef Empty<T> = T Function();

class Request {
  static Future<List<T>> getAllModel<T>(
    String url,
    JsonDecoder<T> fromJson,
  ) async {
    var body = {};
    var data = await RequestDio.callAPI(
      url,
      body,
      'GET',
    );
    List<T> objects = [];
    if (data != null ) {
      for (Map<String, dynamic> d in data['items']) {
        T r = fromJson(d);
        objects.add(r);
      }
      return objects;
    }
    return [];
  }

  static Future<String> createModel(Model obj, String url) async {
    var body = {};
    body = obj.toJson();
    var data = await RequestDio.callAPI(
      url,
      body,
      'POST',
    );
    print(data);
    if (data['success']) {
      g.Get.snackbar(
        'message',
        'Task added successfully',
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
      );
      return data['data']['_id'];
    } else {
      g.Get.snackbar(
        'Failed',
        'something went wrong',
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
      );
      return "";
    }
  }

  static Future<bool> deleteModelByID<T>(String url) async {
    var body = {};
    var data = await RequestDio.callAPI(
      url,
      body,
      'DELETE',
    );
    try {
      if (data['success']) {
        g.Get.snackbar(
          'message',
          'Task Deleted successfully',
          duration: const Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
        );
        return true;
      }
    } catch (e, stacktrace) {
      print("deleted model() | catch exception");
      print(e);
      print(stacktrace);
    }
    g.Get.snackbar(
      'Failed',
      'something went wrong',
      duration: const Duration(seconds: 5),
      snackPosition: SnackPosition.BOTTOM,
    );
    return false;
  }

  static Future<bool> updateModel(Model obj, String url) async {
    try {
      var body = obj.toJson();
      var data = await RequestDio.callAPI(url, body, 'PUT');
      if (data != null) {
        g.Get.snackbar(
          'message',
          'Task updated successfully',
          duration: const Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
        );
        return true;
      }
    } catch (e, stacktrace) {
      print("updateModel() | catch exception");
      print(e);
      print(stacktrace);
    }
    g.Get.snackbar(
      'Failed',
      'something went wrong',
      duration: const Duration(seconds: 5),
      snackPosition: SnackPosition.BOTTOM,
    );
    return false;
  }
}
