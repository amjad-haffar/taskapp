const String serverName = 'http://api.nstack.in/v1';

enum apis { getTask, postTask, updateTask, deleteTask,}

class ApiName {
  static String name(apis k) {
    switch (k) {
      case apis.getTask:
        return 'http://api.nstack.in/v1/todos?page=1&limit=10';
      case apis.postTask:
        return '/todos';
      case apis.updateTask:
        return '/todos/';
      case apis.deleteTask:
        return '/todos/';
      default:
        return '';
    }
  }
}
