import 'package:flutter/material.dart';
import 'package:to_do_list/models/modle.dart';

class ToDoItem extends StatefulWidget {
  const ToDoItem({Key? key, required this.todo,required this.todochange,required this.tododelete}) : super(key: key);
  final ToDo todo;
  final todochange ;
  final tododelete;

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}
class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.grey.shade50,),
        child: ListTile(
          onTap: (){
            widget.todochange(widget.todo);},
          textColor: Colors.grey,
          leading: IconButton(onPressed: (){},
              icon: Icon(widget.todo.isdone? Icons.check_box:Icons.check_box_outline_blank)),
          title: Text(widget.todo.todotext!,
              style: TextStyle(
                  decoration:  widget.todo.isdone? TextDecoration.lineThrough : null)),
                  trailing: IconButton(onPressed:(){
                    widget.tododelete(widget.todo.id);
                  }, icon: Icon(Icons.delete,color: Colors.red,))
        ),
      ),
    );
  }
}
