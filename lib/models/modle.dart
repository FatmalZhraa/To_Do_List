class ToDo {
  String? id;
  String? todotext;
  bool isdone;

  ToDo({required this.id,required this.todotext,this.isdone=false});

static List<ToDo> todolist(){
  return[
      ToDo(id: '1', todotext: 'OOP Assignment',isdone: true),
    ToDo(id: '2', todotext: 'flutter Assignment',isdone: true),
    ToDo(id: '3', todotext: 'Archi Assignment'),
    ToDo(id: '4', todotext: 'Msp Assignment'),
    ToDo(id: '5', todotext: 'Database Assignment'),
  ];
}
}