
import 'package:flutter/material.dart';
import 'package:to_do_app/models/to_do.dart';

class ToDoItem extends StatelessWidget {
  final ToDo toDo;
  // ignore: prefer_typing_uninitialized_variables
  final onToDoChange;
  // ignore: prefer_typing_uninitialized_variables
  final onDeleteItem;
  const ToDoItem({Key? key , required this.toDo , required this.onToDoChange , required this.onDeleteItem }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: () {
          onToDoChange(toDo);
          },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,

        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        leading:  Icon(
          toDo.isDone? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.grey,
          size: 30,
        ),
        title:  Text(
          toDo.todoText!,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            decoration: toDo.isDone? TextDecoration.lineThrough: null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
          child: IconButton(
              color: Colors.white,
              iconSize: 18,
              onPressed: (){
                onDeleteItem(toDo.id);
              },
              icon: const Icon(Icons.delete),
          )
        )
        ),
      );
  }
}