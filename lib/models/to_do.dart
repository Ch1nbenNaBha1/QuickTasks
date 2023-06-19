class ToDo{
  String? id;
  String? todoText;
  bool isDone;
  ToDo({
    this.id,
    this.todoText,
    this.isDone = false,
  });
  static List<ToDo> toDoList(){
    return [];
  }
}