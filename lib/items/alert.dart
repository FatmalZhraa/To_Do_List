import 'package:flutter/material.dart';
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSaved;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSaved,
    required this.onCancel,});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              style: TextStyle(color: Colors.white),
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                 borderSide:BorderSide (color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(50.0),
                ),

                hintText: "Add a new task",
                hintStyle: TextStyle(color: Colors.grey)
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(child:Text ("Save"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple,),
                    onPressed: onSaved),
                SizedBox(width: 8),
                ElevatedButton(child: Text ("Cancel"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple,),
                    onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
