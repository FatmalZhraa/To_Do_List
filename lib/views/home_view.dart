import 'package:flutter/material.dart';
import 'package:to_do_list/items/alert.dart';
import 'package:to_do_list/items/to_do_item.dart';
import 'package:to_do_list/models/modle.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView> {

  List <ToDo>found_to_do=[];
 final todolist= ToDo.todolist();
  final todocontroller=TextEditingController();

  @override

  void initState() {
    found_to_do = todolist;
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:Colors.black ,
        child:Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
          Container(
          decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),color: Colors.grey.shade900),
        child: TextField(
          onChanged: (value) => Search(value),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(contentPadding:EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search,color: Colors.white),
            prefixIconConstraints: BoxConstraints(
                maxHeight: 20,
                minWidth: 25),
            hintText: "Search Task",
            hoverColor: Colors.white,
            hintStyle: TextStyle(color: Colors.grey.shade600),
          ),
        ) ,
      ),

              Expanded(
                child: ListView(
                  children: [
                    Container(
                     margin: EdgeInsets.only(
                       top: 50,
                       bottom: 20,
                     ),
                      child: Text('All Tasks',),
                    ),
                    for(ToDo i in found_to_do.reversed )
                    ToDoItem(todo : i,
                      todochange:handletochange ,
                      tododelete: deletetodo,
                    ),
                  ],
                ),
              ),

              FloatingActionButton(
                onPressed: createNewTask,
                child: Icon(Icons.add),
                backgroundColor: Colors.deepPurple,
              ),
            ],
          ),
        ) ,
      ),
      appBar: AppBar(
        title:Text('To Do List'),
        toolbarTextStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
             height: 40,
             width: 40,
             child: ClipRRect(
                 borderRadius:BorderRadius.circular(70),
                 child: Image.asset("images/personal.jpeg",)),
           ),
        ),
        ],
        leading:  IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
      ),
    );
  }
 void handletochange(ToDo todo){
    setState(() {
      todo.isdone=!todo.isdone;
    });
 }
 void deletetodo(String id){
    setState(() {
      todolist.removeWhere((item) => item.id==id);
    });
 }
  void Search(String keyword){
    List<ToDo>search_results=[];
    if(keyword.isEmpty)
    {
      search_results=todolist;
    }
    else
    {
      search_results=
          todolist.where((item) => item.todotext!.toLowerCase().contains(keyword.toLowerCase())).toList();
    }
    setState(() {
      found_to_do=search_results;
    });
  }
  void saveNewTask() {
    setState(() {
      todolist.add(
        ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(),
            todotext: todocontroller.text),
      );
      todocontroller.clear();
    });
    Navigator.of(context).pop();
  }
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: todocontroller,
          onSaved: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }
}
