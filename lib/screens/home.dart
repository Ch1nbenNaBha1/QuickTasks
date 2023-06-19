import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Widgets/to_do_item.dart';

import 'package:to_do_app/models/to_do.dart';
import 'package:to_do_app/provider/theme_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final toDoList = ToDo.toDoList();
  final _searchController = TextEditingController();
  List<ToDo> _searchResult = [];


  @override
  void initState() {
    _searchResult = toDoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    final provider = Provider.of<ThemeProvider>(context);
    bool isDarkmode = false;

    return Scaffold(

        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title:  Row(
            children: [
              IconButton(onPressed: (){
                setState(() {
                  isDarkmode = !isDarkmode;
                  provider.toggleTheme();
                });
              },
                icon:Icon( isDarkmode ? Icons.light_mode : Icons.dark_mode ), color: Theme.of(context).iconTheme.color,),
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(children: [
                  searchBox(),
                  Expanded(
                      child: ListView(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 50, bottom: 20),
                          child:  Text(
                            "All To Do's",
                            style: TextStyle(
                              color: Theme.of(context).iconTheme.color  ,
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      for (ToDo toDo in _searchResult.reversed)
                        ToDoItem(
                          toDo: toDo,
                          onToDoChange: _handleToDoChange,
                          onDeleteItem: _handleDeleteItem,
                        ),
                    ],
                  )
                  ),
                ])
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                Expanded(child: Container(
                  margin: const EdgeInsets.only(
                      bottom: 20,
                      right: 20 ,
                      left: 20
                  ),
                  decoration: BoxDecoration(
                    color: ThemeData().scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                      offset: Offset(0, 5),
                    ),]
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: "Add New To Do",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
                    ),
                  ),
                )),
                Container(
                  margin: const EdgeInsets.only(bottom: 20,right: 20),
                  child: FloatingActionButton(
                    onPressed: () {
                      _addToDoItem(_searchController.text);
                    },
                    backgroundColor: Colors.blueAccent,
                    shape: const CircleBorder(),
                    child: const Icon(Icons.add_task_outlined),
                  )
                )
              ],)
            )
          ],
        ));

  }
  void _handleSearch(String text) {

    List<ToDo> resultList = [];
    if(text.isEmpty) {
      resultList = toDoList;
    }else{
      resultList = toDoList.where((element) => element.todoText!.toLowerCase().contains(text.toLowerCase())).toList();
    }
    setState(() {
      _searchResult = resultList;
    });
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleDeleteItem(String id) {
    setState(() {
      toDoList.removeWhere((element) => element.id == id);
    });
  }
  void _addToDoItem(String todoText){
    setState(() {
      toDoList.add(ToDo(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        todoText: todoText,
        isDone: false,
      ));
      _searchController.clear();
    });
  }
  Widget searchBox() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        onChanged: (value) => _handleSearch(value),
        decoration: const  InputDecoration(
          contentPadding:  EdgeInsets.all(0),
          prefixIcon:  Icon(
              Icons.search ,
              color: Colors.black,
              size: 20
          ) ,
          prefixIconConstraints: BoxConstraints(
            minWidth: 25,
            maxHeight: 20,
          ),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      )
      ,
    );
  }
}



