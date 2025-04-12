import 'package:dio/dio.dart';
import 'package:untitled/models/todolistmodel.dart';

class TaskService {
  static Dio dio = Dio();

  static Future<TaskModel> getData() async {
    try {
      Response response = await dio.get(
          'https://dummyjson.com/todos/user/13'
      );
      if (response.statusCode == 200)
      {
        return TaskModel.fromJson(response.data);
      }
      else
        {
          throw Exception("Error");
        }
    }
    catch(ex)
    {
      throw Exception(ex);
    }
  }

  static Future<void> addItem({
    required String newTask,
    required bool completed,
  }) async {
    await dio.post(
        'https://jsonplaceholder.typicode.com/posts',
        data: {
          "todo": newTask,
          "completed ": completed,
          "userId": 13}
    );
  }
}
