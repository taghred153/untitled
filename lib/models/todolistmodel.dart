class TaskModel {
  List<Map<String, dynamic>> todos;
  int total;
  TaskModel({required this.todos , required this.total });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        todos: List<Map<String, dynamic>>.from(json["todos"]),
        total: json["total"]
    );
  }
}